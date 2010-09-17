/**
 * This data store provides information for automatically generating lists of widgets
 * given a collection of metadata provided by the UIDataProvider_MenuItem class.
 *
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */
class UIDataStore_MenuItems extends UIDataStore_GameResource
	native(inherit)
	config(UI);

/**
 * the tag used to retrieve the menu items for the gametype options of the OnlineGameSettings datastore's selected game configuration.
 */
var	const								name				CurrentGameSettingsTag;

/** collection of providers per part type. */
var	const	private	native	transient	MultiMap_Mirror		OptionProviders{TMultiMap<FName, class UUIDataProvider_MenuItem*>};

/** Array of dynamically created providers. */
var transient array<UIDataProvider_MenuItem>				DynamicProviders;

cpptext
{
	/* === UUIDataStore_MenuItems interface === */
	/**
	 * Converts the specified name into the tag required to access the options for the current game settings object,
	 * if the specified field is CurrentGameSettingsTag.  Otherwise, does nothing.
	 *
	 * @param	FieldName	the name of the field that was passed to this data store.
	 *
	 * @return	a tag which can be used to access the settings collection for the current game settings object, or the same
	 *			value as the input value.
	 */
	FName ResolveFieldName( FName FieldName ) const;
	FString ResolveFieldString( const FString& FieldString ) const;

	/**
	 * Called when this data store is added to the data store manager's list of active data stores.
	 *
	 * @param	PlayerOwner		the player that will be associated with this DataStore.  Only relevant if this data store is
	 *							associated with a particular player; NULL if this is a global data store.
	 */
	virtual void OnRegister( ULocalPlayer* PlayerOwner );

	/**
	 * Gets the list of element providers for a fieldname with filtered elements removed.
	 *
	 * @param FieldName				Fieldname to use to search for providers.
	 * @param OutElementProviders	Array to store providers in.
	 */
	void GetFilteredElementProviders(FName FieldName, TArray<class UUIDataProvider_MenuItem*>& OutElementProviders);

	/* === IUIListElementProvider interface === */
	/**
	 * Retrieves the list of all data tags contained by this element provider which correspond to list element data.
	 *
	 * @return	the list of tags supported by this element provider which correspond to list element data.
	 */
	virtual TArray<FName> GetElementProviderTags();


	/**
	 * Returns the number of list elements associated with the data tag specified.
	 *
	 * @param	FieldName	the name of the property to get the element count for.  guaranteed to be one of the values returned
	 *						from GetElementProviderTags.
	 *
	 * @return	the total number of elements that are required to fully represent the data specified.
	 */
	virtual INT GetElementCount( FName FieldName );

	/**
	 * Retrieves the list elements associated with the data tag specified.
	 *
	 * @param	FieldName		the name of the property to get the element count for.  guaranteed to be one of the values returned
	 *							from GetElementProviderTags.
	 * @param	out_Elements	will be filled with the elements associated with the data specified by DataTag.
	 *
	 * @return	TRUE if this data store contains a list element data provider matching the tag specified.
	 */
	virtual UBOOL GetListElements( FName FieldName, TArray<INT>& out_Elements );

	/* === UIDataProvider interface === */
	/**
	 * Resolves the value of the data field specified and stores it in the output parameter.
	 *
	 * @param	FieldName		the data field to resolve the value for;  guaranteed to correspond to a property that this provider
	 *							can resolve the value for (i.e. not a tag corresponding to an internal provider, etc.)
	 * @param	out_FieldValue	receives the resolved value for the property specified.
	 *							@see GetDataStoreValue for additional notes
	 * @param	ArrayIndex		optional array index for use with data collections
	 *
	 * @todo - not yet implemented
	 */
	virtual UBOOL GetFieldValue( const FString& FieldName, struct FUIProviderFieldValue& out_FieldValue, INT ArrayIndex=INDEX_NONE );

	/**
	 * Gets the list of data fields exposed by this data provider.
	 *
	 * @param	out_Fields	will be filled in with the list of tags which can be used to access data in this data provider.
	 *						Will call GetScriptDataTags to allow script-only child classes to add to this list.
	 */
	virtual void GetSupportedDataFields( TArray<struct FUIDataProviderField>& out_Fields );

	/**
	 * Retrieves a list element for the specified data tag that can provide the list with the available cells for this list element.
	 * Used by the UI editor to know which cells are available for binding to individual list cells.
	 *
	 * @param	FieldName		the tag of the list element data provider that we want the schema for.
	 *
	 * @return	a pointer to some instance of the data provider for the tag specified.  only used for enumerating the available
	 *			cell bindings, so doesn't need to actually contain any data (i.e. can be the CDO for the data provider class, for example)
	 */
	virtual TScriptInterface<class IUIListElementCellProvider> GetElementCellSchemaProvider( FName FieldName );

	/**
	 * Retrieves a UIListElementCellProvider for the specified data tag that can provide the list with the values for the cells
	 * of the list element indicated by CellValueProvider.DataSourceIndex
	 *
	 * @param	FieldName		the tag of the list element data field that we want the values for
	 * @param	ListIndex		the list index for the element to get values for
	 *
	 * @return	a pointer to an instance of the data provider that contains the value for the data field and list index specified
	 */
	virtual TScriptInterface<class IUIListElementCellProvider> GetElementCellValueProvider( FName FieldName, INT ListIndex );

	/**
	 * Resolves the value of the data field specified and stores the value specified to the appropriate location for that field.
	 *
	 * @param	FieldName		the data field to resolve the value for;  guaranteed to correspond to a property that this provider
	 *							can resolve the value for (i.e. not a tag corresponding to an internal provider, etc.)
	 * @param	FieldValue		the value to store for the property specified.
	 * @param	ArrayIndex		optional array index for use with data collections
	 */
	virtual UBOOL SetFieldValue( const FString& FieldName, const struct FUIProviderScriptFieldValue& FieldValue, INT ArrayIndex=INDEX_NONE );

	/**
	 * Determines whether a member of a collection should be considered "enabled" by subscribed lists.  Disabled elements will still be displayed in the list
	 * but will be drawn using the disabled state.
	 *
	 * @param	FieldName			the name of the collection data field that CollectionIndex indexes into.
	 * @param	CollectionIndex		the index into the data field collection indicated by FieldName to check
	 *
	 * @return	TRUE if FieldName doesn't correspond to a valid collection data field, CollectionIndex is an invalid index for that collection,
	 *			or the item is actually enabled; FALSE only if the item was successfully resolved into a data field value, but should be considered disabled.
	 */
	virtual UBOOL IsElementEnabled( FName FieldName, INT CollectionIndex );
}

/**
 * Clears all options in the specified set.
 *
 * @param SetName		Set to clear
 */
native function ClearSet(name SetName);

/**
 * Appends N amount of providers to the specified set.
 *
 * @param SetName		Set to append to
 * @param NumOptions	Number of options to append
 */
native function AppendToSet(name SetName, int NumOptions);

/**
 * Retrieves a set of option providers.
 *
 * @param SetName		Set to retrieve
 * @param OutProviders	Storage array for resulting providers.
 *
 */
native function GetSet(name SetName, out array<UIDataProvider_MenuItem> OutProviders);

/**
 * Handler for the OnlineGameSettings data store's OnDataProviderPropertyChange delegate.  When the selected gametype is
 * changed, updates the current game option set.
 *
 * @param	SourceProvider	the data provider that generated the notification
 * @param	PropTag			the property that changed
 */
function OnGameSettingsChanged( UIDataProvider SourceProvider, optional name PropTag )
{
	local UIDataStore_OnlineGameSettings GameSettingsDataStore;

	GameSettingsDataStore = UIDataStore_OnlineGameSettings(SourceProvider);
	if ( GameSettingsDataStore != None && PropTag == 'SelectedIndex' )
	{
		RefreshSubscribers(CurrentGameSettingsTag, true, Self);
	}
}

/* === UIDataStore interface === */
/**
 * Called when this data store is added to the data store manager's list of active data stores.
 *
 * @param	PlayerOwner		the player that will be associated with this DataStore.  Only relevant if this data store is
 *							associated with a particular player; NULL if this is a global data store.
 */
event Registered( LocalPlayer PlayerOwner )
{
	local UIDataStore_OnlineGameSettings GameSettingsDataStore;

	Super.Registered(PlayerOwner);

	GameSettingsDataStore = UIDataStore_OnlineGameSettings(class'UIRoot'.static.StaticResolveDataStore(class'UIDataStore_OnlineGameSettings'.default.Tag));
	if ( GameSettingsDataStore != None )
	{
		GameSettingsDataStore.AddPropertyNotificationChangeRequest(OnGameSettingsChanged);
	}
}

/**
 * Called when this data store is removed from the data store manager's list of active data stores.
 *
 * @param	PlayerOwner		the player that will be associated with this DataStore.  Only relevant if this data store is
 *							associated with a particular player; NULL if this is a global data store.
 */
event Unregistered( LocalPlayer PlayerOwner )
{
	local UIDataStore_OnlineGameSettings GameSettingsDataStore;

	Super.Unregistered(PlayerOwner);


	GameSettingsDataStore = UIDataStore_OnlineGameSettings(class'UIRoot'.static.StaticResolveDataStore(class'UIDataStore_OnlineGameSettings'.default.Tag));
	if ( GameSettingsDataStore != None )
	{
		GameSettingsDataStore.RemovePropertyNotificationChangeRequest(OnGameSettingsChanged);
	}
}

DefaultProperties
{
	Tag=MenuItems
	WriteAccessType=ACCESS_ReadOnly

	CurrentGameSettingsTag=CurrentGameSettings
}


