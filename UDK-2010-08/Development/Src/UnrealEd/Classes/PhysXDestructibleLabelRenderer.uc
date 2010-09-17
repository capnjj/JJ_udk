/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 *
 * This is the PhysX destructible label renderer
 */
class PhysXDestructibleLabelRenderer extends ThumbnailLabelRenderer
	native;

cpptext
{
protected:
	/**
	 * Adds the name of the object and information about meshes, assets & chunks
	 *
	 * @param Object the object to build the labels for
	 * @param OutLabels the array that is added to
	 */
	void BuildLabelList(UObject* Object, const ThumbnailOptions& InOptions, TArray<FString>& OutLabels);
}
