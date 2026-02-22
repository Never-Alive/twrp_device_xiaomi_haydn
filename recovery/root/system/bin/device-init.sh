#!/system/bin/sh

property_override() {
    resetprop "$1" "$2"
}

model_property_override() {
    device="$1"
    name="$2"
    model="$3"

    property_override ro.build.product "$device"
    property_override ro.product.device "$device"
    property_override ro.product.odm.device "$device"
    property_override ro.product.vendor.device "$device"
    property_override ro.product.product.device "$device"
    property_override ro.product.system_ext.device "$device"
    property_override ro.product.system.device "$device"

    property_override ro.product.name "$name"
    property_override ro.product.odm.name "$name"
    property_override ro.product.vendor.name "$name"
    property_override ro.product.product.name "$name"
    property_override ro.product.system_ext.name "$name"
    property_override ro.product.system.name "$name"

    property_override ro.product.model "$model"
    property_override ro.product.odm.model "$model"
    property_override ro.product.vendor.model "$model"
    property_override ro.product.product.model "$model"
    property_override ro.product.system_ext.model "$model"
    property_override ro.product.system.model "$model"
}

vendor_load_properties() {

    property_override ro.bootimage.build.date.utc 1609430400
    property_override ro.build.date.utc 1609430400

    sku=$(getprop ro.boot.hardware.sku)
    hwc=$(getprop ro.boot.hwc)

    if [ "$sku" = "haydn" ]; then
        if [ "$hwc" = "CN" ]; then
            model_property_override "haydn" "haydn" "Redmi K40 Pro"
        else
            model_property_override "haydn" "haydn" "Mi 11i"
        fi

    elif [ "$sku" = "haydnpro" ]; then
        model_property_override "haydn" "haydnpro" "Redmi K40 Pro+"

    elif [ "$sku" = "haydn_in" ]; then
        model_property_override "haydnin" "haydn_in" "Mi 11X Pro"

    else
        model_property_override "unknown" "unknown" "unknown name"
    fi
}

vendor_load_properties

exit 0
