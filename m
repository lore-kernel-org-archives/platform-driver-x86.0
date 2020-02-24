From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support laptops where the first battery is named BATT
Date: Mon, 24 Feb 2020 01:10:17 +0000
Message-ID: <20200224011017.C5207208C4@mail.kernel.org>
References: <20200223181832.17131-1-kristian@klausen.dk>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200223181832.17131-1-kristian@klausen.dk>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
Cc: Kristian Klausen <kristian@klausen.dk>, stable@vger.kernel.orgstable@vger.kernel.orgstable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.5.5, v5.4.21, v4.19.105, v4.14.171, v4.9.214, v4.4.214.

v5.5.5: Build OK!
v5.4.21: Build OK!
v4.19.105: Failed to apply! Possible dependencies:
    11e87702be65 ("PCI: pciehp: Differentiate between surprise and safe removal")
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    80696f991424 ("PCI: pciehp: Tolerate Presence Detect hardwired to zero")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    eee6e273843d ("PCI: pciehp: Drop hotplug_slot_ops wrappers")

v4.14.171: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    4aed1cd6fb95 ("PCI: pciehp: Document struct slot and struct controller")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    c7abb2352c29 ("PCI: Remove unnecessary messages for memory allocation failures")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")

v4.9.214: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    4aed1cd6fb95 ("PCI: pciehp: Document struct slot and struct controller")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    c7abb2352c29 ("PCI: Remove unnecessary messages for memory allocation failures")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")

v4.4.214: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    2ac83cccabbc ("PCI: hotplug: Use list_for_each_entry() to simplify code")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    89379f165a1b ("PCI/hotplug: pnv_php: export symbols and move struct types needed by cxl")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")
    ef69b03dfd32 ("MAINTAINERS: Add powerpc drivers to the powerpc section")
    ff3ce480e8b5 ("PCI: Fix all whitespace issues")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
