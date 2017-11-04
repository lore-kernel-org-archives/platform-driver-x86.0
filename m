From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: drivers/x86: add thinkpad-wmi
Date: Sat, 4 Nov 2017 16:23:19 +0100
Message-ID: <CAHR064iYRWeCpAQ-FfWK+=6iiJNDGsSBu1vrEt5Sp2iFTmAo8Q@mail.gmail.com>
References: <20171021064102.15166-1-corentin.chary@gmail.com> <b16e8dbf-a40a-9392-5fb6-c09ef4501171@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:44897 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751534AbdKDPXW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Nov 2017 11:23:22 -0400
In-Reply-To: <b16e8dbf-a40a-9392-5fb6-c09ef4501171@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Oct 24, 2017 at 10:59 PM, Mario Limonciello
<Mario.Limonciello@dell.com> wrote:
> Hi Chary,
>
> I think it's interesting to see this submission coming in at this time.
> We're working on setting up precedent for how WMI vendor drivers should w=
ork
> right now and I have another patch series that sets up some concepts.  Th=
ey
> do clash a little with what you've done here, so let me share some contex=
t.
>
> The hope is that eventually drivers on the WMI bus don't need to be very
> rich in code, but more intelligence comes from the bus.  That would mean
> that the bus parses the MOF and knows what types of data would be passed =
in
> individual method GUIDs.  The bus would know what size of data that is an=
d
> what fields represent what in data objects.  The vendor drivers may add s=
ome
> filtering or permissions checking, but that would be it.
>
> We still don't have MOF parsing in the kernel, but I think that it's good=
 to
> set up concepts that reflect how we want it to work until it's available.
> That should mean that if you get the interfaces right that later your dri=
ver
> can shrink.  My patch series isn't yet accepted, so what I'm doing isn't
> necessarily the way it will be done, I just want to let you know about it=
.
>
> The big notable differences with how we're approaching our drivers:
> 1) GUID's that provide methods are given direct execution paths in sysfs
> files through your patch.  This means that there could be a ton of differ=
ent
> sysfs attributes that vary from vendor to vendor based on what they offer=
.
> I set up a concept that method type GUID's would be handled by the WMI bu=
s
> by creating a character device in the /dev/wmi and copying in/out data fo=
r
> those method objects.

Wouldn't that be a little harder to use from userspace ? (But I can
see how it makes it more generic).

>
> 2) You don't register all devices with the WMI bus.  Each of your GUIDs t=
hat
> you interact with should really be registered with the bus.  Some of the
> data you're interested in should be exposed there.
> I can't speak on behalf of Darren and Andy here, but I would anticipate t=
hey
> don't want "new" WMI drivers introduced that don't register and use the W=
MI
> bus properly.  I only see the single GUID that registered.

Well, these aren't really "devices". I can register all methods to the
BUS  though, but it'll be weird for the end user.
What is your suggestion here ?

>
> 3) Your driver provides more granular data than mine (as that's how it is
> exposed by Lenovo's design).  I think this is a good thing, and you shoul=
d
> find a way to programattically expose your attributes to sysfs instead of
> debugfs if possible.
>
> The driver looks very good to me though, a few nested comments:

Thanks for the review Mario. I'm afraid I won't have much more time in
the near future to make changes to this driver. What do you think
would be the minimal set of changes to make this good enough to be
merged ?

>
> On 10/21/2017 01:41 AM, Corentin Chary wrote:
>>
>> This driver has been available on
>> https://github.com/iksaif/thinkpad-wmi for
>> a few year and is already deployed on large
>> fleets of thinkpad laptops.
>>
>> The WMI interface is documented here:
>>
>> http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_=
en.pdf
>>
>> It mostly focused on changing BIOS/Firmware settings.
>>
>> Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
>> ---
>>   .../ABI/testing/sysfs-platform-thinkpad-wmi        |   50 +
>>   Documentation/platform/thinkpad-wmi.txt            |   92 ++
>>   drivers/platform/x86/Kconfig                       |   10 +
>>   drivers/platform/x86/Makefile                      |    1 +
>>   drivers/platform/x86/thinkpad-wmi.c                | 1210
>> ++++++++++++++++++++
>>   5 files changed, 1363 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-thinkpad-w=
mi
>>   create mode 100644 Documentation/platform/thinkpad-wmi.txt
>>   create mode 100644 drivers/platform/x86/thinkpad-wmi.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-thinkpad-wmi
>> b/Documentation/ABI/testing/sysfs-platform-thinkpad-wmi
>> new file mode 100644
>> index 000000000000..c3673876c5b3
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-thinkpad-wmi
>> @@ -0,0 +1,50 @@
>> +What:          /sys/devices/platform/thinkpad-wmi/password
>> +Date:          Aug 2017
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               BIOS password needs to be written in this file if set
>> +               to be able to change BIOS settings.
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/password_encoding
>> +Date:          Aug 2017
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Password encoding ('ascii' or 'scanmode').
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/password_kbd_lang
>> +Date:          Aug 2017
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Keyboard language used for password. One of 'us', 'fr' a=
nd
>> 'gr'.
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/password_type
>> +Date:          Aug 2017
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Password type to be changed when password_change is
>> written to, e.g. 'pap'.
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/password_change
>> +Date:          Aug 2017
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Writing to this file will set the password specified in
>> password_type.
>> +               The new password will not take effect until the next
>> reboot.
>
> By splitting up these various different password related fields into
> writable
> sysfs attributes can't you potentially have a problem of two userspace
> applications
> competing to write out a password of different types?
>
> Eg one application writes to password_type while another writes to
> password_change.
>
> It seems like this should be an entirely atomic operation.  That's part o=
f
> why I think a character
> device might be better for this data.
>
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/password_settings
>> +Date:          Oct 2015
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Display various password settings.
>> +
>> +What:          /sys/devices/platform/thinkpad-wmi/load_default_settings
>> +Date:          Oct 2015
>> +KernelVersion: 4.14
>> +Contact:       "Corentin Chary" <corentin.chary@gmail.com>
>> +Description:
>> +               Write anything to this file to load default BIOS setting=
s.
>> diff --git a/Documentation/platform/thinkpad-wmi.txt
>> b/Documentation/platform/thinkpad-wmi.txt
>> new file mode 100644
>> index 000000000000..40d141aecc7b
>> --- /dev/null
>> +++ b/Documentation/platform/thinkpad-wmi.txt
>> @@ -0,0 +1,92 @@
>> +# thinkpad-wmi
>> +
>> +Linux Driver for Thinkpad WMI interface, allows you to control most
>> +BIOS settings from Linux, and maybe more.
>
> Maybe more?
>
>> +
>> +## sysfs interface
>> +
>> +Directory: /sys/bus/wmi/drivers/thinkpad-wmi/
>> +
>> +Each setting exposed by the WMI interface is available under its own na=
me
>> +in this sysfs directory. Read from the file to get the current value
>> (line 1)
>> +and list of options (line 2), and write an option to the file to set it=
.
>> +
>> +Additionally, there are some extra files for querying and managing BIOS
>> +password(s).
>> +
>> +### password
>> +
>> +Must contain the BIOS supervisor password (aka 'pap'), if set, to be ab=
le
>> to do
>> +any change.
>> +
>> +Every subsequent password change will be authorized with this password.
>> The
>> +password may be unloaded by writing an empty string. Writing an invalid
>> +password may trigger the BIOS' invalid password limit, such that a rebo=
ot
>> will
>> +be required in order to make any further BIOS changes.
>> +
>> +### password_encoding
>> +
>> +Encoding used for the password, either '', 'scancode' or 'ascii'.
>> +
>> +Scan-code encoding appears to require the key-down scan codes, e.g. 0x1=
e,
>> 0x30,
>> +0x2e for the ASCII encoded password 'abc'.
>> +
>> +### password_kbd_lang
>> +
>> +Keyboard language mapping, can be '', 'us', 'fr' or 'gr'.
>> +
>> +### password_type
>> +
>> +Specify the password type to be changed when password_change is written
>> to.
>> +Can be:
>> +* 'pap': supervisor password
>> +* 'pop': power-on-password
>> +
>> +Other types may be valid, e.g. for user and master disk passwords.
>> +
>> +### password_change
>> +
>> +Writing to this file will change the password specified by password_typ=
e.
>> The
>> +new password will not take effect until the next reboot.
>> +
>> +### password_settings
>> +
>> +Display password related settings. This includes:
>> +
>> +* password_state: which passwords are set, if any
>> +  * bit 0: user password (power on password) is installed / 'pop'
>> +  * bit 1: admin/supervisor password is installed / 'pap'
>> +  * bit 2: hdd password(s) installed
>> +* supported_encodings: supported keyboard encoding(s)
>> +  * bit 0: ASCII
>> +  * bit 1: scancode
>> +* supported_keyboard: support keyboard language(s)
>> +  * bit 0: us
>> +  * bit 1: fr
>> +  * bit 2: gr
>
> Requiring a decoder ring to a single sysfs attribute isn't really a great
> interface.
>>
>> +
>> +### load_default_settings
>> +
>> +Reset all settings to factory default.
>> +
>> +## debugfs interface
>> +
>> +The debugfs interface maps closely to the WMI Interface (see driver and
>> doc).
>> +
>> +* bios_settings: show all BIOS settings
>> +* bios_setting: show BIOS setting for <instance>
>> +* list_valid_choices: list settings for <argument>
>> +* set_bios_settings: call set bios settings command with <argument>.
>> +* save_bios_settings call save bios settings command with <argument>.
>> +* discard_bios_settings: call discard bios settings command with
>> <argument>.
>> +* load_default: call load default with <argument>.
>> +* set_bios_password: call set BIOS password with <argument>.
>> +* argument: argument to be used in various commands.
>> +* instance: setting instance.
>> +* instance_count: number of settings.
>> +* password_settings: password settings.
>
> Why not bring these through sysfs?  I think that any userspace applicatio=
ns
> would want to use them.
> Generically it should be possible to let the bus populate them in a
> subdirectory or something.
>>
>> +
>> +## References
>> +
>> +Thinkpad WMI interface documentation:
>>
>> +http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy=
_en.pdf
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 80b87954f6dd..4e2e8a04228a 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -511,6 +511,16 @@ config THINKPAD_ACPI_HOTKEY_POLL
>>           If you are not sure, say Y here.  The driver enables polling
>> only if
>>           it is strictly necessary to do so.
>>   +config THINKPAD_WMI
>> +       tristate "THINKPAD WMI Driver (EXPERIMENTAL)"
>
> Is the (EXPERIMENTAL) really necessary?  It sounds like you've been
> iterating on this
> driver for a while.
>>
>> +       depends on ACPI_WMI
>
> A few other newer drivers lately have had DEFAULT ACPI_WMI to select when
> WMI
> is turned on.  Since this driver doesn't clash with anything, I think it
> makes sense to
> pick this default too.
>>
>> +       ---help---
>> +         This driver allow you to modify BIOS passwords, settings, and
>> boot order
>> +         using Windows Management Instrumentation (WMI) through the
>> Lenovo
>> +         client-management interface.
>> +
>
> I didn't notice boot order mentioned in the driver.  Did I miss it?
>
>> +         Say Y here if you have a WMI aware Thinkpad.
>> +
>>   config SENSORS_HDAPS
>>         tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>>         depends on INPUT
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
>> index 91cec1751461..3b03f0744794 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_TC1100_WMI)      +=3D tc1100-wmi.o
>>   obj-$(CONFIG_SONY_LAPTOP)     +=3D sony-laptop.o
>>   obj-$(CONFIG_IDEAPAD_LAPTOP)  +=3D ideapad-laptop.o
>>   obj-$(CONFIG_THINKPAD_ACPI)   +=3D thinkpad_acpi.o
>> +obj-$(CONFIG_THINKPAD_WMI)     +=3D thinkpad-wmi.o
>>   obj-$(CONFIG_SENSORS_HDAPS)   +=3D hdaps.o
>>   obj-$(CONFIG_FUJITSU_LAPTOP)  +=3D fujitsu-laptop.o
>>   obj-$(CONFIG_FUJITSU_TABLET)  +=3D fujitsu-tablet.o
>> diff --git a/drivers/platform/x86/thinkpad-wmi.c
>> b/drivers/platform/x86/thinkpad-wmi.c
>> new file mode 100644
>> index 000000000000..c102971f2979
>> --- /dev/null
>> +++ b/drivers/platform/x86/thinkpad-wmi.c
>> @@ -0,0 +1,1210 @@
>> +/*
>> + * Thinkpad WMI configuration driver
>> + *
>> + * Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
>> + *
>> + *  This program is free software; you can redistribute it and/or modif=
y
>> + *  it under the terms of the GNU General Public License as published b=
y
>> + *  the Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful,
>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *  GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/types.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/wmi.h>
>> +
>> +#define        THINKPAD_WMI_FILE       "thinkpad-wmi"
>> +
>> +MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
>> +MODULE_DESCRIPTION("Thinkpad WMI Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> +/* WMI interface */
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_BiosSetting
>> + * Description:
>> + *  Get item name and settings for current WMI instance.
>> + * Type:
>> + *  Query
>> + * Returns:
>> + *  "Item,Value"
>> + * Example:
>> + *  "WakeOnLAN,Enable"
>> + */
>> +#define LENOVO_BIOS_SETTING_GUID               \
>> +       "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_SetBiosSetting
>> + * Description:
>> + *  Change the BIOS setting to the desired value using the
>> Lenovo_SetBiosSetting
>> + *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
>> + *  BIOS settings and values are case sensitive.
>> + *  After making changes to the BIOS settings, you must reboot the
>> computer
>> + *  before the changes will take effect.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Item,Value,Password,Encoding,KbdLang;"
>> + * Example:
>> + *  "WakeOnLAN,Disable,pswd,ascii,us;"
>> + */
>> +#define LENOVO_SET_BIOS_SETTINGS_GUID          \
>> +       "98479A64-33F5-4E33-A707-8E251EBBC3A1"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_SaveBiosSettings
>> + * Description:
>> + *  Save any pending changes in settings.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Password,Encoding,KbdLang;"
>> + * Example:
>> + * "pswd,ascii,us;"
>> + */
>> +#define LENOVO_SAVE_BIOS_SETTINGS_GUID         \
>> +       "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
>> +
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_DiscardBiosSettings
>> + * Description:
>> + *  Discard any pending changes in settings.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Password,Encoding,KbdLang;"
>> + * Example:
>> + *  "pswd,ascii,us;"
>> + */
>> +#define LENOVO_DISCARD_BIOS_SETTINGS_GUID      \
>> +       "74F1EBB6-927A-4C7D-95DF-698E21E80EB5"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_LoadDefaultSettings
>> + * Description:
>> + *  Load default BIOS settings. Use Lenovo_SaveBiosSettings to save the
>> + *  settings.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Password,Encoding,KbdLang;"
>> + * Example:
>> + *  "pswd,ascii,us;"
>> + */
>> +#define LENOVO_LOAD_DEFAULT_SETTINGS_GUID      \
>> +       "7EEF04FF-4328-447C-B5BB-D449925D538D"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_BiosPasswordSettings
>> + * Description:
>> + *  Return BIOS Password settings
>> + * Type:
>> + *  Query
>> + * Returns:
>> + *  PasswordMode, PasswordState, MinLength, MaxLength,
>> + *  SupportedEncoding, SupportedKeyboard
>> + */
>> +#define LENOVO_BIOS_PASSWORD_SETTINGS_GUID             \
>> +       "8ADB159E-1E32-455C-BC93-308A7ED98246"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_SetBiosPassword
>> + * Description:
>> + *  Change a specific password.
>> + *  - BIOS settings cannot be changed at the same boot as power-on
>> + *    passwords (POP) and hard disk passwords (HDP). If you want to
>> change
>> + *    BIOS settings and POP or HDP, you must reboot the system after
>> changing
>> + *    one of them.
>> + *  - A password cannot be set using this method when one does not
>> already
>> + *    exist. Passwords can only be updated or cleared.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
>> + * Example:
>> + *  "pop,oldpop,newpop,ascii,us;=E2=80=9D
>> + */
>> +#define LENOVO_SET_BIOS_PASSWORD_GUID  \
>> +       "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
>> +
>> +/**
>> + * Name:
>> + *  Lenovo_GetBiosSelections
>> + * Description:
>> + *  Return a list valid settings for a given item.
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Item"
>> + * Returns:
>> + *  "Value1,Value2,Value3,..."
>> + * Example:
>> + *  -> "FlashOverLAN"
>> + *  <- "Enabled,Disabled"
>> + */
>> +#define LENOVO_GET_BIOS_SELECTIONS_GUID        \
>> +       "7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
>> +
>> +/**
>> + * Name:
>> + *  ???
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  ???
>> + * Example:
>> + *  ???
>> + * WMI-Internals:
>> + *  Return big chunk of data
>> + */
>> +#define LENOVO_QUERY_GUID                      \
>> +       "05901221-D566-11D1-B2F0-00A0C9062910"
>> +
>> +/* Return values */
>> +
>> +enum {
>> +       /*
>> +        * "Success"
>> +        * Operation completed successfully.
>> +        */
>> +       THINKPAD_WMI_SUCCESS =3D 0,
>> +       /*
>> +        * "Not Supported"
>> +        * The feature is not supported on this system.
>> +        */
>> +       THINKPAD_WMI_NOT_SUPPORTED =3D -ENODEV,
>> +       /*
>> +        * "Invalid"
>> +        * The item or value provided is not valid parameter
>> +        */
>> +       THINKPAD_WMI_INVALID =3D -EINVAL,
>> +       /*
>> +        * "Access Denied"
>> +        * The change could not be made due to an authentication problem=
.
>> +        * If a supervisor password exists, the correct supervisor
>> password
>> +        * must be provided.
>> +        */
>> +       THINKPAD_WMI_ACCESS_DENIED =3D -EPERM,
>> +       /* "System Busy"
>> +        * BIOS changes have already been made that need to be committed=
.
>> +        * Reboot the system and try again.
>> +        */
>> +       THINKPAD_WMI_SYSTEM_BUSY =3D -EBUSY
>> +};
>> +
>> +/* Only add an alias on this one, since it's the one used
>> + * in thinkpad_wmi_probe.
>> + */
>> +MODULE_ALIAS("wmi:"LENOVO_BIOS_SETTING_GUID);
>
> If you split this up to several WMI devices you will need to think about =
how
> the interaction model looks between the different devices in your module.
>
>> +
>> +struct thinkpad_wmi_pcfg {
>> +       uint32_t password_mode;
>> +       uint32_t password_state;
>> +       uint32_t min_length;
>> +       uint32_t max_length;
>> +       uint32_t supported_encodings;
>> +       uint32_t supported_keyboard;
>> +};
>> +
>> +/*
>> + * thinkpad_wmi/       - debugfs root directory
>> + *   bios_settings
>> + *   bios_setting
>> + *   list_valid_choices
>> + *   set_bios_settings
>> + *   save_bios_settings
>> + *   discard_bios_settings
>> + *   load_default
>> + *   set_bios_password
>> + *   argument
>> + *   instance
>> + *   instance_count
>> + *   bios_password_settings
>> + */
>> +struct thinkpad_wmi_debug {
>> +       struct dentry *root;
>> +
>> +       u8 instances_count;
>> +       u8 instance;
>> +       char argument[512];
>> +};
>> +
>> +struct thinkpad_wmi {
>> +       struct wmi_device *wmi_device;
>> +
>> +       int settings_count;
>> +
>> +       char password[64];
>> +       char password_encoding[64];
>> +       char password_kbdlang[4]; /* 2 bytes for \n\0 */
>> +       char auth_string[256];
>> +       char password_type[64];
>> +
>> +       bool can_set_bios_settings;
>> +       bool can_discard_bios_settings;
>> +       bool can_load_default_settings;
>> +       bool can_get_bios_selections;
>> +       bool can_set_bios_password;
>> +       bool can_get_password_settings;
>> +
>> +       char *settings[256];
>> +       struct dev_ext_attribute *devattrs;
>> +       struct thinkpad_wmi_debug debug;
>> +};
>> +
>> +/* helpers */
>> +static int thinkpad_wmi_errstr_to_err(const char *errstr)
>> +{
>> +       if (!strcmp(errstr, "Success"))
>> +               return THINKPAD_WMI_SUCCESS;
>> +       if (!strcmp(errstr, "Not Supported"))
>> +               return THINKPAD_WMI_NOT_SUPPORTED;
>> +       if (!strcmp(errstr, "Invalid"))
>> +               return THINKPAD_WMI_INVALID;
>> +       if (!strcmp(errstr, "Access Denied"))
>> +               return THINKPAD_WMI_ACCESS_DENIED;
>> +       if (!strcmp(errstr, "System Busy"))
>> +               return THINKPAD_WMI_SYSTEM_BUSY;
>> +
>> +       pr_debug("Unknown error string: '%s'", errstr);
>> +
>> +       return -EINVAL;
>> +}
>> +
>> +static int thinkpad_wmi_extract_error(const struct acpi_buffer *output)
>> +{
>> +       const union acpi_object *obj;
>> +       int ret;
>> +
>> +       obj =3D output->pointer;
>> +       if (!obj || obj->type !=3D ACPI_TYPE_STRING || !obj->string.poin=
ter)
>> +               return -EIO;
>> +
>> +       ret =3D thinkpad_wmi_errstr_to_err(obj->string.pointer);
>> +       kfree(obj);
>> +       return ret;
>> +}
>> +
>> +static int thinkpad_wmi_simple_call(const char *guid,
>> +                                   const char *arg)
>> +{
>> +       const struct acpi_buffer input =3D { strlen(arg), (char *)arg };
>> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +       acpi_status status;
>> +
>> +       status =3D wmi_evaluate_method(guid, 0, 0, &input, &output);
>> +
>> +       if (ACPI_FAILURE(status))
>> +               return -EIO;
>> +
>> +       return thinkpad_wmi_extract_error(&output);
>> +}
>> +
>> +static int thinkpad_wmi_extract_output_string(const struct acpi_buffer
>> *output,
>> +                                             char **string)
>> +{
>> +       const union acpi_object *obj;
>> +
>> +       obj =3D output->pointer;
>> +       if (!obj || obj->type !=3D ACPI_TYPE_STRING || !obj->string.poin=
ter)
>> +               return -EIO;
>> +
>> +       *string =3D kstrdup(obj->string.pointer, GFP_KERNEL);
>> +       kfree(obj);
>> +       return *string ? 0 : -ENOMEM;
>> +}
>> +
>> +static int thinkpad_wmi_bios_setting(int item, char **value)
>> +{
>> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +       acpi_status status;
>> +
>> +       status =3D wmi_query_block(LENOVO_BIOS_SETTING_GUID, item, &outp=
ut);
>> +       if (ACPI_FAILURE(status))
>> +               return -EIO;
>> +
>> +       return thinkpad_wmi_extract_output_string(&output, value);
>> +}
>> +
>> +static int thinkpad_wmi_get_bios_selections(const char *item, char
>> **value)
>> +{
>> +       const struct acpi_buffer input =3D { strlen(item), (char *)item =
};
>> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +       acpi_status status;
>> +
>> +       status =3D wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
>> +                                    0, 0, &input, &output);
>> +
>> +       if (ACPI_FAILURE(status))
>> +               return -EIO;
>> +
>> +       return thinkpad_wmi_extract_output_string(&output, value);
>> +}
>> +
>> +static int thinkpad_wmi_set_bios_settings(const char *settings)
>> +{
>> +       return thinkpad_wmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID,
>> +                                       settings);
>> +}
>> +
>> +static int thinkpad_wmi_save_bios_settings(const char *password)
>> +{
>> +       return thinkpad_wmi_simple_call(LENOVO_SAVE_BIOS_SETTINGS_GUID,
>> +                                       password);
>> +}
>> +
>> +static int thinkpad_wmi_discard_bios_settings(const char *password)
>> +{
>> +       return thinkpad_wmi_simple_call(LENOVO_DISCARD_BIOS_SETTINGS_GUI=
D,
>> +                                       password);
>> +}
>> +
>> +static int thinkpad_wmi_load_default(const char *password)
>> +{
>> +       return thinkpad_wmi_simple_call(LENOVO_LOAD_DEFAULT_SETTINGS_GUI=
D,
>> +                                       password);
>> +}
>> +
>> +static int thinkpad_wmi_set_bios_password(const char *settings)
>> +{
>> +       return thinkpad_wmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID,
>> +                                       settings);
>> +}
>> +
>> +static int thinkpad_wmi_password_settings(struct thinkpad_wmi_pcfg *pcf=
g)
>> +{
>> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>> +       const union acpi_object *obj;
>> +       acpi_status status;
>> +
>> +       status =3D wmi_query_block(LENOVO_BIOS_PASSWORD_SETTINGS_GUID, 0=
,
>> +                                &output);
>> +       if (ACPI_FAILURE(status))
>> +               return -EIO;
>> +
>> +       obj =3D output.pointer;
>> +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || !obj->buffer.poin=
ter)
>> +               return -EIO;
>> +       if (obj->buffer.length !=3D sizeof(*pcfg)) {
>> +               pr_warn("Unknown pcfg buffer length %d\n",
>> obj->buffer.length);
>> +               kfree(obj);
>> +               return -EIO;
>> +       }
>> +
>> +       memcpy(pcfg, obj->buffer.pointer, obj->buffer.length);
>> +       kfree(obj);
>> +       return 0;
>> +}
>> +
>> +/* sysfs */
>> +
>> +#define to_ext_attr(x) container_of(x, struct dev_ext_attribute, attr)
>> +
>> +static ssize_t show_setting(struct device *dev,
>> +                           struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev);
>> +       struct dev_ext_attribute *ea =3D to_ext_attr(attr);
>> +       int item =3D (uintptr_t)ea->var;
>> +       char *name =3D thinkpad->settings[item];
>> +       char *settings =3D NULL, *choices =3D NULL, *value;
>> +       ssize_t count =3D 0;
>> +       int ret;
>> +
>> +       ret =3D thinkpad_wmi_bios_setting(item, &settings);
>> +       if (ret)
>> +               return ret;
>> +       if (!settings)
>> +               return -EIO;
>> +
>> +       if (thinkpad->can_get_bios_selections) {
>> +               ret =3D thinkpad_wmi_get_bios_selections(name, &choices)=
;
>> +               if (ret)
>> +                       goto error;
>> +               if (!choices || !*choices) {
>> +                       ret =3D -EIO;
>> +                       goto error;
>> +               }
>> +       }
>> +
>> +       value =3D strchr(settings, ',');
>> +       if (!value)
>> +               goto error;
>> +       value++;
>> +
>> +       count =3D sprintf(buf, "%s\n", value);
>> +       if (choices)
>> +               count +=3D sprintf(buf + count, "%s\n", choices);
>> +
>> +error:
>> +       kfree(settings);
>> +       kfree(choices);
>> +       return ret ? ret : count;
>> +}
>> +
>> +static ssize_t store_setting(struct device *dev,
>> +                             struct device_attribute *attr,
>> +                             const char *buf, size_t count)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev);
>> +       struct dev_ext_attribute *ea =3D to_ext_attr(attr);
>> +       int item_idx =3D (uintptr_t)ea->var;
>> +       const char *item =3D thinkpad->settings[item_idx];
>> +       int ret;
>> +       size_t buffer_size;
>> +       char *buffer;
>> +
>> +       /* Format: 'Item,Value,Authstring;' */
>> +       buffer_size =3D (strlen(item) + 1 + count + 1 +
>> +                      sizeof(thinkpad->auth_string) + 2);
>> +       buffer =3D kmalloc(buffer_size, GFP_KERNEL);
>> +       if (!buffer)
>> +               return -ENOMEM;
>> +
>> +       strcpy(buffer, item);
>> +       strcat(buffer, ",");
>> +       strncat(buffer, buf, count);
>> +       if (count)
>> +               strim(buffer);
>> +       if (*thinkpad->auth_string) {
>> +               strcat(buffer, ",");
>> +               strcat(buffer, thinkpad->auth_string);
>> +       }
>> +       strcat(buffer, ";");
>> +
>> +       ret =3D thinkpad_wmi_set_bios_settings(buffer);
>> +       if (ret)
>> +               goto end;
>> +
>> +       ret =3D thinkpad_wmi_save_bios_settings(thinkpad->auth_string);
>> +       if (ret) {
>> +               /* Try to discard the settings if we failed to apply the=
m.
>> */
>> +               thinkpad_wmi_discard_bios_settings(thinkpad->auth_string=
);
>> +               goto end;
>> +       }
>> +       ret =3D count;
>> +
>> +end:
>> +       kfree(buffer);
>> +       return ret;
>> +}
>> +
>> +
>> +/* Password related sysfs methods */
>> +static ssize_t show_auth(struct thinkpad_wmi *thinkpad, char *buf,
>> +                        const char *data, size_t size)
>> +{
>> +       if (!capable(CAP_SYS_ADMIN))
>> +               return -EPERM;
>> +
>> +       return sprintf(buf, "%s\n", data ? : "(nil)");
>> +}
>> +
>> +/* Create the auth string from password chunks */
>> +static void update_auth_string(struct thinkpad_wmi *thinkpad)
>> +{
>> +       if (!*thinkpad->password) {
>> +               /* No password at all */
>> +               thinkpad->auth_string[0] =3D '\0';
>> +               return;
>> +       }
>> +       strcpy(thinkpad->auth_string, thinkpad->password);
>> +
>> +       if (*thinkpad->password_encoding) {
>> +               strcat(thinkpad->auth_string, ",");
>> +               strcat(thinkpad->auth_string,
>> thinkpad->password_encoding);
>> +       }
>> +
>> +       if (*thinkpad->password_kbdlang) {
>> +               strcat(thinkpad->auth_string, ",");
>> +               strcat(thinkpad->auth_string, thinkpad->password_kbdlang=
);
>> +       }
>> +}
>> +
>> +static ssize_t store_auth(struct thinkpad_wmi *thinkpad,
>> +                         const char *buf, size_t count,
>> +                         char *dst, size_t size)
>> +{
>> +       ssize_t ret;
>> +
>> +       if (!capable(CAP_SYS_ADMIN))
>> +               return -EPERM;
>> +
>> +       if (count > size - 1)
>> +               return -EINVAL;
>> +
>> +       /* dst may be being reused, NUL-terminate */
>> +       ret =3D strscpy(dst, buf, size);
>> +       if (ret < 0)
>> +               return ret;
>> +       if (count)
>> +               strim(dst);
>> +
>> +       update_auth_string(thinkpad);
>> +
>> +       return count;
>> +}
>> +
>> +#define THINKPAD_WMI_CREATE_AUTH_ATTR(_name, _uname, _mode)            =
\
>> +       static ssize_t show_##_name(struct device *dev,                 =
\
>> +                                   struct device_attribute *attr,      =
\
>> +                                   char *buf)                          =
\
>> +       {                                                               =
\
>> +               struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev); =
  \
>> +                                                                       =
\
>> +               return show_auth(thinkpad, buf,                         =
\
>> +                                thinkpad->_name,                       =
\
>> +                                sizeof(thinkpad->_name));              =
\
>> +       }                                                               =
\
>> +       static ssize_t store_##_name(struct device *dev,                =
\
>> +                                    struct device_attribute *attr,     =
\
>> +                                    const char *buf, size_t count)     =
\
>> +       {                                                               =
\
>> +               struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev); =
  \
>> +                                                                       =
\
>> +               return store_auth(thinkpad, buf, count,                 =
\
>> +                                 thinkpad->_name,                      =
\
>> +                                 sizeof(thinkpad->_name));             =
\
>> +       }                                                               =
\
>> +       static struct device_attribute dev_attr_##_name =3D {           =
  \
>> +               .attr =3D {                                             =
  \
>> +                       .name =3D _uname,                               =
  \
>> +                       .mode =3D _mode },                              =
  \
>> +               .show   =3D show_##_name,                               =
  \
>> +               .store  =3D store_##_name,                              =
  \
>> +       }
>> +
>> +THINKPAD_WMI_CREATE_AUTH_ATTR(password, "password", 0600);
>> +THINKPAD_WMI_CREATE_AUTH_ATTR(password_encoding, "password_encoding",
>> +                             0600);
>> +THINKPAD_WMI_CREATE_AUTH_ATTR(password_kbdlang, "password_kbd_lang",
>> +                             0600);
>> +THINKPAD_WMI_CREATE_AUTH_ATTR(password_type, "password_type", 0600);
>> +
>> +static ssize_t show_password_settings(struct device *dev,
>> +                                     struct device_attribute *attr,
>> +                                     char *buf)
>> +{
>> +       struct thinkpad_wmi_pcfg pcfg;
>> +       ssize_t ret;
>> +
>> +       ret =3D thinkpad_wmi_password_settings(&pcfg);
>> +       if (ret)
>> +               return ret;
>> +       ret +=3D sprintf(buf, "password_mode:       %#x\n",
>> pcfg.password_mode);
>> +       ret +=3D sprintf(buf + ret, "password_state:      %#x\n",
>> +                      pcfg.password_state);
>> +       ret +=3D sprintf(buf + ret, "min_length:          %d\n",
>> pcfg.min_length);
>> +       ret +=3D sprintf(buf + ret, "max_length:          %d\n",
>> pcfg.max_length);
>> +       ret +=3D sprintf(buf + ret, "supported_encodings: %#x\n",
>> +                      pcfg.supported_encodings);
>> +       ret +=3D sprintf(buf + ret, "supported_keyboard:  %#x\n",
>> +                      pcfg.supported_keyboard);
>> +       return ret;
>> +}
>> +
>> +static DEVICE_ATTR(password_settings, 0400, show_password_settings,
>> NULL);
>> +
>> +static ssize_t store_password_change(struct device *dev,
>> +                                    struct device_attribute *attr,
>> +                                    const char *buf, size_t count)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev);
>> +       size_t buffer_size;
>> +       char *buffer;
>> +       ssize_t ret;
>> +
>> +       if (!capable(CAP_SYS_ADMIN))
>> +               return -EPERM;
>> +
>> +       /* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>> +
>> +       /* auth_string is the size of CurrentPassword,Encoding,KbdLang *=
/
>> +       buffer_size =3D (sizeof(thinkpad->password_type) + 1 + count + 1=
 +
>> +                      sizeof(thinkpad->auth_string) + 2);
>> +       buffer =3D kmalloc(buffer_size, GFP_KERNEL);
>> +       if (!buffer)
>> +               return -ENOMEM;
>> +
>> +       strcpy(buffer, thinkpad->password_type);
>> +
>> +       if (*thinkpad->password) {
>> +               strcat(buffer, ",");
>> +               strcat(buffer, thinkpad->password);
>> +       }
>> +       strcat(buffer, ",");
>> +       strncat(buffer, buf, count);
>> +       if (count)
>> +               strim(buffer);
>> +
>> +       if (*thinkpad->password_encoding) {
>> +               strcat(buffer, ",");
>> +               strcat(buffer, thinkpad->password_encoding);
>> +       }
>> +       if (*thinkpad->password_kbdlang) {
>> +               strcat(buffer, ",");
>> +               strcat(buffer, thinkpad->password_kbdlang);
>> +       }
>> +       strcat(buffer, ";");
>> +
>> +       ret =3D thinkpad_wmi_set_bios_password(buffer);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return count;
>> +}
>> +
>> +static struct device_attribute dev_attr_password_change =3D {
>> +       .attr =3D {
>> +               .name =3D "password_change",
>> +               .mode =3D 0200 },
>> +       .store  =3D store_password_change,
>> +};
>> +
>> +
>> +static ssize_t store_load_default(struct device *dev,
>> +                                 struct device_attribute *attr,
>> +                                 const char *buf, size_t count)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(dev);
>> +
>> +       return thinkpad_wmi_load_default(thinkpad->auth_string);
>> +}
>> +
>> +static DEVICE_ATTR(load_default_settings, 0200, NULL,
>> store_load_default);
>> +
>> +static struct attribute *platform_attributes[] =3D {
>> +       &dev_attr_password_settings.attr,
>> +       &dev_attr_password.attr,
>> +       &dev_attr_password_encoding.attr,
>> +       &dev_attr_password_kbdlang.attr,
>> +       &dev_attr_password_type.attr,
>> +       &dev_attr_password_change.attr,
>> +       &dev_attr_load_default_settings.attr,
>> +       NULL
>> +};
>> +
>> +static umode_t thinkpad_sysfs_is_visible(struct kobject *kobj,
>> +                                        struct attribute *attr,
>> +                                        int idx)
>> +{
>> +       bool supported =3D true;
>> +
>> +       return supported ? attr->mode : 0;
>> +}
>> +
>> +static struct attribute_group platform_attribute_group =3D {
>> +       .is_visible     =3D thinkpad_sysfs_is_visible,
>> +       .attrs          =3D platform_attributes
>> +};
>> +
>> +static void thinkpad_wmi_sysfs_exit(struct wmi_device *wdev)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(&wdev->dev);
>> +       int i;
>> +
>> +       sysfs_remove_group(&wdev->dev.kobj, &platform_attribute_group);
>> +
>> +       if (!thinkpad->devattrs)
>> +               return;
>> +
>> +       for (i =3D 0; i < thinkpad->settings_count; ++i) {
>> +               struct dev_ext_attribute *deveattr =3D
>> &thinkpad->devattrs[i];
>> +               struct device_attribute *devattr =3D &deveattr->attr;
>> +
>> +               if (devattr->attr.name)
>> +                       device_remove_file(&wdev->dev, devattr);
>> +       }
>> +       kfree(thinkpad->devattrs);
>> +       thinkpad->devattrs =3D NULL;
>> +}
>> +
>> +static int __init thinkpad_wmi_sysfs_init(struct wmi_device *wdev)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D dev_get_drvdata(&wdev->dev);
>> +       struct dev_ext_attribute *devattrs;
>> +       int count =3D thinkpad->settings_count;
>> +       int i, ret;
>> +
>> +       devattrs =3D kmalloc_array(count, sizeof(*devattrs), GFP_KERNEL)=
;
>> +       if (!devattrs)
>> +               return -ENOMEM;
>> +       thinkpad->devattrs =3D devattrs;
>> +
>> +       for (i =3D 0; i < count; ++i) {
>> +               struct dev_ext_attribute *deveattr =3D &devattrs[i];
>> +               struct device_attribute *devattr =3D &deveattr->attr;
>> +
>> +               sysfs_attr_init(&devattr->attr);
>> +               devattr->attr.name =3D thinkpad->settings[i];
>> +               devattr->attr.mode =3D 0644;
>> +               devattr->show =3D show_setting;
>> +               devattr->store =3D store_setting;
>> +               deveattr->var =3D (void *)(uintptr_t)i;
>> +               ret =3D device_create_file(&wdev->dev, devattr);
>> +               if (ret) {
>> +                       /* Name is used to check is file has been create=
d.
>> */
>> +                       devattr->attr.name =3D NULL;
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return sysfs_create_group(&wdev->dev.kobj,
>> &platform_attribute_group);
>> +}
>> +
>> +/*
>> + * Platform device
>> + */
>> +static int __init thinkpad_wmi_platform_init(struct thinkpad_wmi
>> *thinkpad)
>> +{
>> +       return thinkpad_wmi_sysfs_init(thinkpad->wmi_device);
>> +}
>> +
>> +static void thinkpad_wmi_platform_exit(struct thinkpad_wmi *thinkpad)
>> +{
>> +       thinkpad_wmi_sysfs_exit(thinkpad->wmi_device);
>> +}
>> +
>> +/* debugfs */
>> +
>> +static ssize_t dbgfs_write_argument(struct file *file,
>> +                                   const char __user *userbuf,
>> +                                   size_t count, loff_t *pos)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D
>> file->f_path.dentry->d_inode->i_private;
>> +       char *kernbuf =3D thinkpad->debug.argument;
>> +       size_t size =3D sizeof(thinkpad->debug.argument);
>> +
>> +       if (count > PAGE_SIZE - 1)
>> +               return -EINVAL;
>> +
>> +       if (count > size - 1)
>> +               return -EINVAL;
>> +
>> +       if (copy_from_user(kernbuf, userbuf, count))
>> +               return -EFAULT;
>> +
>> +       kernbuf[count] =3D 0;
>> +
>> +       strim(kernbuf);
>> +
>> +       return count;
>> +}
>> +
>> +static int dbgfs_show_argument(struct seq_file *m, void *v)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       seq_printf(m, "%s\n", thinkpad->debug.argument);
>> +       return 0;
>> +}
>> +
>> +static int thinkpad_wmi_debugfs_argument_open(struct inode *inode,
>> +                                             struct file *file)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D inode->i_private;
>> +
>> +       return single_open(file, dbgfs_show_argument, thinkpad);
>> +}
>> +
>> +static const struct file_operations thinkpad_wmi_debugfs_argument_fops =
=3D
>> {
>> +       .open           =3D thinkpad_wmi_debugfs_argument_open,
>> +       .read           =3D seq_read,
>> +       .llseek         =3D seq_lseek,
>> +       .release        =3D single_release,
>> +       .write          =3D dbgfs_write_argument,
>> +};
>> +
>> +struct thinkpad_wmi_debugfs_node {
>> +       struct thinkpad_wmi *thinkpad;
>> +       char *name;
>> +       int (*show)(struct seq_file *m, void *data);
>> +};
>> +
>> +static void show_bios_setting_line(struct thinkpad_wmi *thinkpad,
>> +                                  struct seq_file *m, int i, bool
>> list_valid)
>> +{
>> +       int ret;
>> +       char *settings =3D NULL, *choices =3D NULL, *p;
>> +
>> +       ret =3D thinkpad_wmi_bios_setting(i, &settings);
>> +       if (ret || !settings)
>> +               return;
>> +
>> +       p =3D strchr(settings, ',');
>> +       if (p)
>> +               *p =3D '=3D';
>> +       seq_printf(m, "%s", settings);
>> +
>> +
>> +       if (!thinkpad->can_get_bios_selections)
>> +               goto line_feed;
>> +
>> +       if (p)
>> +               *p =3D '\0';
>> +
>> +       ret =3D thinkpad_wmi_get_bios_selections(settings, &choices);
>> +       if (ret || !choices || !*choices)
>> +               goto line_feed;
>> +
>> +       seq_printf(m, "\t[%s]", choices);
>> +
>> +line_feed:
>> +       kfree(settings);
>> +       kfree(choices);
>> +       seq_puts(m, "\n");
>> +}
>> +
>> +static int dbgfs_bios_settings(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +       int i;
>> +
>> +       for (i =3D 0; i < thinkpad->settings_count; ++i)
>> +               show_bios_setting_line(thinkpad, m, i, true);
>> +
>> +       return 0;
>> +}
>> +
>> +static int dbgfs_bios_setting(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       show_bios_setting_line(m->private, m, thinkpad->debug.instance,
>> false);
>> +       return 0;
>> +}
>> +
>> +static int dbgfs_list_valid_choices(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +       char *choices =3D NULL;
>> +       int ret;
>> +
>> +       ret =3D thinkpad_wmi_get_bios_selections(thinkpad->debug.argumen=
t,
>> +                                              &choices);
>> +
>> +       if (ret || !choices || !*choices) {
>> +               kfree(choices);
>> +               return -EIO;
>> +       }
>> +
>> +       seq_printf(m, "%s\n", choices);
>> +       kfree(choices);
>> +       return 0;
>> +}
>> +
>> +static int dbgfs_set_bios_settings(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       return thinkpad_wmi_set_bios_settings(thinkpad->debug.argument);
>> +}
>> +
>> +static int dbgfs_save_bios_settings(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       return thinkpad_wmi_save_bios_settings(thinkpad->debug.argument)=
;
>> +}
>> +
>> +static int dbgfs_discard_bios_settings(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       return
>> thinkpad_wmi_discard_bios_settings(thinkpad->debug.argument);
>> +}
>> +
>> +static int dbgfs_load_default(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       return thinkpad_wmi_load_default(thinkpad->debug.argument);
>> +}
>> +
>> +static int dbgfs_set_bios_password(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi *thinkpad =3D m->private;
>> +
>> +       return thinkpad_wmi_set_bios_password(thinkpad->debug.argument);
>> +}
>> +
>> +static int dbgfs_bios_password_settings(struct seq_file *m, void *data)
>> +{
>> +       struct thinkpad_wmi_pcfg pcfg;
>> +       int ret;
>> +
>> +       ret =3D thinkpad_wmi_password_settings(&pcfg);
>> +       if (ret)
>> +               return ret;
>> +       seq_printf(m, "password_mode:       %#x\n", pcfg.password_mode);
>> +       seq_printf(m, "password_state:      %#x\n", pcfg.password_state)=
;
>> +       seq_printf(m, "min_length:          %d\n", pcfg.min_length);
>> +       seq_printf(m, "max_length:          %d\n", pcfg.max_length);
>> +       seq_printf(m, "supported_encodings: %#x\n",
>> pcfg.supported_encodings);
>> +       seq_printf(m, "supported_keyboard:  %#x\n",
>> pcfg.supported_keyboard);
>> +       return 0;
>> +}
>> +
>> +static struct thinkpad_wmi_debugfs_node thinkpad_wmi_debug_files[] =3D =
{
>> +       { NULL, "bios_settings", dbgfs_bios_settings },
>> +       { NULL, "bios_setting", dbgfs_bios_setting },
>> +       { NULL, "list_valid_choices", dbgfs_list_valid_choices },
>> +       { NULL, "set_bios_settings", dbgfs_set_bios_settings },
>> +       { NULL, "save_bios_settings", dbgfs_save_bios_settings },
>> +       { NULL, "discard_bios_settings", dbgfs_discard_bios_settings },
>> +       { NULL, "load_default", dbgfs_load_default },
>> +       { NULL, "set_bios_password", dbgfs_set_bios_password },
>> +       { NULL, "bios_password_settings", dbgfs_bios_password_settings }=
,
>> +};
>> +
>> +static int thinkpad_wmi_debugfs_open(struct inode *inode, struct file
>> *file)
>> +{
>> +       struct thinkpad_wmi_debugfs_node *node =3D inode->i_private;
>> +
>> +       return single_open(file, node->show, node->thinkpad);
>> +}
>> +
>> +static const struct file_operations thinkpad_wmi_debugfs_io_ops =3D {
>> +       .owner =3D THIS_MODULE,
>> +       .open  =3D thinkpad_wmi_debugfs_open,
>> +       .read =3D seq_read,
>> +       .llseek =3D seq_lseek,
>> +       .release =3D single_release,
>> +};
>> +
>> +static void __init thinkpad_wmi_debugfs_exit(struct thinkpad_wmi
>> *thinkpad)
>> +{
>> +       debugfs_remove_recursive(thinkpad->debug.root);
>> +}
>> +
>> +static int thinkpad_wmi_debugfs_init(struct thinkpad_wmi *thinkpad)
>> +{
>> +       struct dentry *dent;
>> +       int i;
>> +
>> +       thinkpad->debug.instances_count =3D thinkpad->settings_count;
>> +
>> +       thinkpad->debug.root =3D debugfs_create_dir(THINKPAD_WMI_FILE,
>> NULL);
>> +       if (!thinkpad->debug.root) {
>> +               pr_err("failed to create debugfs directory");
>> +               goto error_debugfs;
>> +       }
>> +
>> +       dent =3D debugfs_create_file("argument", 0644,
>> +                                  thinkpad->debug.root, thinkpad,
>> +                                  &thinkpad_wmi_debugfs_argument_fops);
>> +       if (!dent)
>> +               goto error_debugfs;
>> +
>> +       dent =3D debugfs_create_u8("instance", 0644,
>> +                                thinkpad->debug.root,
>> +                                &thinkpad->debug.instance);
>> +       if (!dent)
>> +               goto error_debugfs;
>> +
>> +       dent =3D debugfs_create_u8("instances_count", 0444,
>> +                                thinkpad->debug.root,
>> +                                &thinkpad->debug.instances_count);
>> +       if (!dent)
>> +               goto error_debugfs;
>
> This exact same information is available from the WMI bus already in
> sysfs.
>
>> +
>> +       for (i =3D 0; i < ARRAY_SIZE(thinkpad_wmi_debug_files); i++) {
>> +               struct thinkpad_wmi_debugfs_node *node;
>> +
>> +               node =3D &thinkpad_wmi_debug_files[i];
>> +
>> +               /* Filter non-present interfaces */
>> +               if (!strcmp(node->name, "set_bios_settings") &&
>> +                   !thinkpad->can_set_bios_settings)
>> +                       continue;
>> +               if (!strcmp(node->name, "dicard_bios_settings") &&
>> +                   !thinkpad->can_discard_bios_settings)
>> +                       continue;
>> +               if (!strcmp(node->name, "load_default_settings") &&
>> +                   !thinkpad->can_load_default_settings)
>> +                       continue;
>> +               if (!strcmp(node->name, "get_bios_selections") &&
>> +                   !thinkpad->can_get_bios_selections)
>> +                       continue;
>> +               if (!strcmp(node->name, "set_bios_password") &&
>> +                   !thinkpad->can_set_bios_password)
>> +                       continue;
>> +               if (!strcmp(node->name, "bios_password_settings") &&
>> +                   !thinkpad->can_get_password_settings)
>> +                       continue;
>> +
>> +               node->thinkpad =3D thinkpad;
>> +               dent =3D debugfs_create_file(node->name, S_IFREG | 0444,
>> +                                          thinkpad->debug.root, node,
>> +                                          &thinkpad_wmi_debugfs_io_ops)=
;
>> +               if (!dent) {
>> +                       pr_err("failed to create debug file: %s\n",
>> node->name);
>> +                       goto error_debugfs;
>> +               }
>> +       }
>> +
>> +
>> +       return 0;
>> +
>> +error_debugfs:
>> +       thinkpad_wmi_debugfs_exit(thinkpad);
>> +       return -ENOMEM;
>> +}
>> +
>> +/* Base driver */
>> +static void __init thinkpad_wmi_analyze(struct thinkpad_wmi *thinkpad)
>> +{
>> +       acpi_status status;
>> +       int i =3D 0;
>> +
>> +       /* Try to find the number of valid settings of this machine
>> +        * and use it to create sysfs attributes.
>> +        */
>> +       for (i =3D 0; i < 0xFF; ++i) {
>> +               char *item =3D NULL;
>> +               char *p;
>> +
>> +               status =3D thinkpad_wmi_bios_setting(i, &item);
>> +               if (ACPI_FAILURE(status))
>> +                       break;
>> +               if (!item || !*item)
>> +                       break;
>> +               /* Remove the value part */
>> +               p =3D strchr(item, ',');
>> +               if (p)
>> +                       *p =3D '\0';
>> +               thinkpad->settings[i] =3D item; /* Cache setting name */
>> +       }
>> +
>> +       thinkpad->settings_count =3D i;
>> +       pr_info("Found %d settings", thinkpad->settings_count);
>> +
>> +       if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
>> +           wmi_has_guid(LENOVO_SAVE_BIOS_SETTINGS_GUID)) {
>> +               thinkpad->can_set_bios_settings =3D true;
>> +       }
>> +
>> +       if (wmi_has_guid(LENOVO_DISCARD_BIOS_SETTINGS_GUID))
>> +               thinkpad->can_discard_bios_settings =3D true;
>> +
>> +       if (wmi_has_guid(LENOVO_LOAD_DEFAULT_SETTINGS_GUID))
>> +               thinkpad->can_load_default_settings =3D true;
>> +
>> +       if (wmi_has_guid(LENOVO_GET_BIOS_SELECTIONS_GUID))
>> +               thinkpad->can_get_bios_selections =3D true;
>> +
>> +       if (wmi_has_guid(LENOVO_SET_BIOS_PASSWORD_GUID))
>> +               thinkpad->can_set_bios_password =3D true;
>> +
>> +       if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
>> +               thinkpad->can_get_password_settings =3D true;
>> +}
>> +
>> +static int __init thinkpad_wmi_add(struct wmi_device *wdev)
>> +{
>> +       struct thinkpad_wmi *thinkpad;
>> +       int err;
>> +
>> +       thinkpad =3D kzalloc(sizeof(struct thinkpad_wmi), GFP_KERNEL);
>> +       if (!thinkpad)
>> +               return -ENOMEM;
>> +
>> +       thinkpad->wmi_device =3D wdev;
>> +       dev_set_drvdata(&wdev->dev, thinkpad);
>> +
>> +       thinkpad_wmi_analyze(thinkpad);
>> +
>> +       err =3D thinkpad_wmi_platform_init(thinkpad);
>> +       if (err)
>> +               goto error_platform;
>> +
>
> So if you register all your devices with the WMI bus and move attributes =
to
> sysfs I don't believe you'll need to create platform devices.
>
>> +       err =3D thinkpad_wmi_debugfs_init(thinkpad);
>> +       if (err)
>> +               goto error_debugfs;
>> +
>> +       return 0;
>> +
>> +error_debugfs:
>> +       thinkpad_wmi_platform_exit(thinkpad);
>> +error_platform:
>> +       kfree(thinkpad);
>> +       return err;
>> +}
>> +
>> +static int __exit thinkpad_wmi_remove(struct wmi_device *wdev)
>> +{
>> +       struct thinkpad_wmi *thinkpad;
>> +       int i;
>> +
>> +       thinkpad =3D dev_get_drvdata(&wdev->dev);
>> +       thinkpad_wmi_debugfs_exit(thinkpad);
>> +       thinkpad_wmi_platform_exit(thinkpad);
>> +
>> +       for (i =3D 0; thinkpad->settings[i]; ++i) {
>> +               kfree(thinkpad->settings[i]);
>> +               thinkpad->settings[i] =3D NULL;
>> +       }
>> +
>> +       kfree(thinkpad);
>> +       return 0;
>> +}
>> +
>> +static int __init thinkpad_wmi_probe(struct wmi_device *wdev)
>> +{
>> +       return thinkpad_wmi_add(wdev);
>> +}
>> +
>> +static const struct wmi_device_id thinkpad_wmi_id_table[] =3D {
>> +       // Search for Lenovo_BiosSetting
>> +       { .guid_string =3D LENOVO_BIOS_SETTING_GUID },
>> +       { },
>> +};
>> +
>> +static struct wmi_driver thinkpad_wmi_driver =3D {
>> +       .driver =3D {
>> +               .name =3D "thinkpad-wmi",
>> +       },
>> +       .id_table =3D thinkpad_wmi_id_table,
>> +       .probe =3D thinkpad_wmi_probe,
>> +       .remove =3D thinkpad_wmi_remove,
>> +};
>> +
>> +static int __init thinkpad_wmi_init(void)
>> +{
>> +       return wmi_driver_register(&thinkpad_wmi_driver);
>> +}
>> +
>> +static void __exit thinkpad_wmi_exit(void)
>> +{
>> +       wmi_driver_unregister(&thinkpad_wmi_driver);
>> +}
>> +
>> +module_init(thinkpad_wmi_init);
>> +module_exit(thinkpad_wmi_exit);



--=20
Corentin Chary
http://xf.iksaif.net
