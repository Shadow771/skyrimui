﻿class dui.InventoryItemList extends dui.DynamicScrollingList
{
    var iMaxTextLength;
	
    function InventoryItemList()
    {
        super();
    }
	
    function SetEntryText(aEntryClip, aEntryObject)
    {
        var _loc5 = ["None", "Equipped", "LeftEquip", "RightEquip", "LeftAndRightEquip"];
		
        if (aEntryObject.text != undefined)
        {
            var _loc3 = aEntryObject.text;
            if (aEntryObject.soulLVL != undefined)
            {
                _loc3 = _loc3 + " (" + aEntryObject.soulLVL + ")";
            }
			
            if (aEntryObject.count > 1)
            {
                _loc3 = _loc3 + " (" + aEntryObject.count.toString() + ")";
            }
			
            if (_loc3.length > iMaxTextLength)
            {
                _loc3 = _loc3.substr(0, iMaxTextLength - 3) + "...";
            }
			
            if (aEntryObject.bestInClass == true)
            {
                _loc3 = _loc3 + "<img src=\'BestIcon.png\' vspace=\'2\'>";
            }
			
            aEntryClip.textField.textAutoSize = "shrink";
            aEntryClip.textField.SetText(_loc3, true);
            if (aEntryObject.negativeEffect == true || aEntryObject.isStealing == true)
            {
                aEntryClip.textField.textColor = aEntryObject.enabled == false ? (8388608) : (16711680);
            }
            else
            {
                aEntryClip.textField.textColor = aEntryObject.enabled == false ? (5000268) : (16777215);
            }
        }
		
        if (aEntryObject != undefined && aEntryObject.equipState != undefined)
        {
            aEntryClip.EquipIcon.gotoAndStop(_loc5[aEntryObject.equipState]);
        }
        else
        {
            aEntryClip.EquipIcon.gotoAndStop("None");
        }
		
        if (aEntryObject.favorite == true && (aEntryObject.equipState == 0 || aEntryObject.equipState == 1))
        {
            aEntryClip.EquipIcon.FavoriteIconInstance.gotoAndStop("On");
        }
        else
        {
            aEntryClip.EquipIcon.FavoriteIconInstance.gotoAndStop("Off");
        }
    } 
}
