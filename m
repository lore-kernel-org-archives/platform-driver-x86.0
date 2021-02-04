Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A7AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7744F64F58
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhBDMbC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 07:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54372 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235832AbhBDMbB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612441772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e2BvFtIhvtlOi8xtyQCsl6d5lfKc2tkik5tdj6M9lRk=;
        b=UKk7lurD7wJR5WQ4XUlItYSV81HfDsaLBcbLO7NMamUykDy2yf2RWd/72bFqwKoJgSedi/
        8RorGCYj/R+y7ORSxK12e+a84iL4s+R8m/MujvkCGOhqDpOxdqPSF/J1lJLlF8RlraOJdK
        IPhSpt/uIfGS/K3Wkn3kk6kNjmvLxu8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-st-mWqm1Nl-sori_hjhXCw-1; Thu, 04 Feb 2021 07:29:30 -0500
X-MC-Unique: st-mWqm1Nl-sori_hjhXCw-1
Received: by mail-ej1-f71.google.com with SMTP id d15so2458637ejc.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 04:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e2BvFtIhvtlOi8xtyQCsl6d5lfKc2tkik5tdj6M9lRk=;
        b=i27zTaRNWZEXuTp4Ema2xG2/W8/RopebuvdFlJLGP83MkT+9U4iTuOy4TlfqHr0VIN
         voYhGYqpDGZ+Zsp4RDpwKr+InLE2WFLi/At3OU2vowKw9A7GIAWmBuLwCzPfohXGLV8f
         xxfOkORNPj/6w3KfrZHOaMGebNwxdhn+CLKxbgFTxfxDt7okoVpp/HThA97SaDAMvHA/
         R/1fQvF18H0om/KJg+8pUkHMX6DbXaQEFlfhjikXrcKdVD1m8rMMMtO1kTiloEx98J4P
         QDgP1jJw93SNlBxIO0SnKGdcdsE4m0gSCGpzrqfAX1AQK8mV3jxLo+JmJHpiw6T8lmiX
         2QCw==
X-Gm-Message-State: AOAM5310Jde57r6DEQvPEVOoF1Vf0uPHbyxIOLIBzX8a/z8VTG0WU9Ya
        zvmDceilazHv6UIwDEe0gILSVhky6rmGCMaDyb6ZLpcIKjnpDNoIrkkS5lRRf1QVPxc3diBgkAg
        i0e/cDQWvjTlklqUoBS//7yKZXOv1GwnkjA==
X-Received: by 2002:a17:906:93f0:: with SMTP id yl16mr6586029ejb.430.1612441769177;
        Thu, 04 Feb 2021 04:29:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznIyRnZFYaRONya4KO2LYozSrZlpkc6o3zKpk5kXZAXWfkMLJYLBoHHFYHqq4UU4fxli3riA==
X-Received: by 2002:a17:906:93f0:: with SMTP id yl16mr6586007ejb.430.1612441768702;
        Thu, 04 Feb 2021 04:29:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id g22sm2419286ejw.31.2021.02.04.04.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 04:29:28 -0800 (PST)
Subject: Re: [PATCH v2] platform/x86: Move all dell drivers to their own
 subdirectory
To:     Mario Limonciello <mario.limonciello@dell.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210203195832.2950605-1-mario.limonciello@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <72e24ee6-a4b5-4fb0-4df1-ffd73192cc29@redhat.com>
Date:   Thu, 4 Feb 2021 13:29:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203195832.2950605-1-mario.limonciello@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 8:58 PM, Mario Limonciello wrote:
> A user without a Dell system doesn't need to pick any of these
> drivers.
> 
> Users with a Dell system can enable this submenu and all drivers
> behind it will be enabled.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

There was one small issue with the patch, all the "default m" lines
which you added were indented with 4 spaces instead of a tab, I've
fixed this up locally.

The patch will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> Changes from v1->v2:
>  - Rename menu per Andy's suggestion
>  - Move if/endif for menu into subdirectory
>  - Set default for menu to "n" but individual modules to "m"
>    Should be same defaults as previous, but allow an "easy" switch
>  MAINTAINERS                                   |  22 +-
>  drivers/platform/x86/Kconfig                  | 176 +--------------
>  drivers/platform/x86/Makefile                 |  16 +-
>  drivers/platform/x86/dell/Kconfig             | 207 ++++++++++++++++++
>  drivers/platform/x86/dell/Makefile            |  21 ++
>  .../platform/x86/{ => dell}/alienware-wmi.c   |   0
>  drivers/platform/x86/{ => dell}/dcdbas.c      |   0
>  drivers/platform/x86/{ => dell}/dcdbas.h      |   0
>  drivers/platform/x86/{ => dell}/dell-laptop.c |   0
>  drivers/platform/x86/{ => dell}/dell-rbtn.c   |   0
>  drivers/platform/x86/{ => dell}/dell-rbtn.h   |   0
>  .../x86/{ => dell}/dell-smbios-base.c         |   0
>  .../platform/x86/{ => dell}/dell-smbios-smm.c |   0
>  .../platform/x86/{ => dell}/dell-smbios-wmi.c |   0
>  drivers/platform/x86/{ => dell}/dell-smbios.h |   0
>  .../platform/x86/{ => dell}/dell-smo8800.c    |   0
>  .../platform/x86/{ => dell}/dell-wmi-aio.c    |   0
>  .../x86/{ => dell}/dell-wmi-descriptor.c      |   0
>  .../x86/{ => dell}/dell-wmi-descriptor.h      |   0
>  .../platform/x86/{ => dell}/dell-wmi-led.c    |   0
>  .../x86/{ => dell}/dell-wmi-sysman/Makefile   |   0
>  .../dell-wmi-sysman/biosattr-interface.c      |   0
>  .../dell-wmi-sysman/dell-wmi-sysman.h         |   0
>  .../dell-wmi-sysman/enum-attributes.c         |   0
>  .../dell-wmi-sysman/int-attributes.c          |   0
>  .../dell-wmi-sysman/passobj-attributes.c      |   0
>  .../dell-wmi-sysman/passwordattr-interface.c  |   0
>  .../dell-wmi-sysman/string-attributes.c       |   0
>  .../x86/{ => dell}/dell-wmi-sysman/sysman.c   |   0
>  drivers/platform/x86/{ => dell}/dell-wmi.c    |   0
>  drivers/platform/x86/{ => dell}/dell_rbu.c    |   0
>  31 files changed, 241 insertions(+), 201 deletions(-)
>  create mode 100644 drivers/platform/x86/dell/Kconfig
>  create mode 100644 drivers/platform/x86/dell/Makefile
>  rename drivers/platform/x86/{ => dell}/alienware-wmi.c (100%)
>  rename drivers/platform/x86/{ => dell}/dcdbas.c (100%)
>  rename drivers/platform/x86/{ => dell}/dcdbas.h (100%)
>  rename drivers/platform/x86/{ => dell}/dell-laptop.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-rbtn.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-rbtn.h (100%)
>  rename drivers/platform/x86/{ => dell}/dell-smbios-base.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-smbios-smm.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-smbios-wmi.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-smbios.h (100%)
>  rename drivers/platform/x86/{ => dell}/dell-smo8800.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-aio.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-descriptor.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-descriptor.h (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-led.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/Makefile (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/biosattr-interface.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/dell-wmi-sysman.h (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/enum-attributes.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/int-attributes.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/passobj-attributes.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/passwordattr-interface.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/string-attributes.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi-sysman/sysman.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell-wmi.c (100%)
>  rename drivers/platform/x86/{ => dell}/dell_rbu.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3e847f7f3dc..ae83c6cff843 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4970,17 +4970,17 @@ M:	Matthew Garrett <mjg59@srcf.ucam.org>
>  M:	Pali Rohár <pali@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-laptop.c
> +F:	drivers/platform/x86/dell/dell-laptop.c
>  
>  DELL LAPTOP FREEFALL DRIVER
>  M:	Pali Rohár <pali@kernel.org>
>  S:	Maintained
> -F:	drivers/platform/x86/dell-smo8800.c
> +F:	drivers/platform/x86/dell/dell-smo8800.c
>  
>  DELL LAPTOP RBTN DRIVER
>  M:	Pali Rohár <pali@kernel.org>
>  S:	Maintained
> -F:	drivers/platform/x86/dell-rbtn.*
> +F:	drivers/platform/x86/dell/dell-rbtn.*
>  
>  DELL LAPTOP SMM DRIVER
>  M:	Pali Rohár <pali@kernel.org>
> @@ -4992,26 +4992,26 @@ DELL REMOTE BIOS UPDATE DRIVER
>  M:	Stuart Hayes <stuart.w.hayes@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell_rbu.c
> +F:	drivers/platform/x86/dell/dell_rbu.c
>  
>  DELL SMBIOS DRIVER
>  M:	Pali Rohár <pali@kernel.org>
>  M:	Mario Limonciello <mario.limonciello@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-smbios.*
> +F:	drivers/platform/x86/dell/dell-smbios.*
>  
>  DELL SMBIOS SMM DRIVER
>  M:	Mario Limonciello <mario.limonciello@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-smbios-smm.c
> +F:	drivers/platform/x86/dell/dell-smbios-smm.c
>  
>  DELL SMBIOS WMI DRIVER
>  M:	Mario Limonciello <mario.limonciello@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/dell-smbios-wmi.c
> +F:	drivers/platform/x86/dell/dell-smbios-wmi.c
>  F:	tools/wmi/dell-smbios-example.c
>  
>  DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
> @@ -5019,12 +5019,12 @@ M:	Stuart Hayes <stuart.w.hayes@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/driver-api/dcdbas.rst
> -F:	drivers/platform/x86/dcdbas.*
> +F:	drivers/platform/x86/dell/dcdbas.*
>  
>  DELL WMI DESCRIPTOR DRIVER
>  M:	Mario Limonciello <mario.limonciello@dell.com>
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi-descriptor.c
> +F:	drivers/platform/x86/dell/dell-wmi-descriptor.c
>  
>  DELL WMI SYSMAN DRIVER
>  M:	Divya Bharathi <divya.bharathi@dell.com>
> @@ -5033,13 +5033,13 @@ M:	Prasanth Ksr <prasanth.ksr@dell.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
> -F:	drivers/platform/x86/dell-wmi-sysman/
> +F:	drivers/platform/x86/dell/dell-wmi-sysman/
>  
>  DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
>  M:	Pali Rohár <pali@kernel.org>
>  S:	Maintained
> -F:	drivers/platform/x86/dell-wmi.c
> +F:	drivers/platform/x86/dell/dell-wmi.c
>  
>  DELTA ST MEDIA DRIVER
>  M:	Hugues Fruchet <hugues.fruchet@st.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..211cf907f041 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -49,18 +49,6 @@ config WMI_BMOF
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called wmi-bmof.
>  
> -config ALIENWARE_WMI
> -	tristate "Alienware Special feature control"
> -	depends on ACPI
> -	depends on LEDS_CLASS
> -	depends on NEW_LEDS
> -	depends on ACPI_WMI
> -	help
> -	 This is a driver for controlling Alienware BIOS driven
> -	 features.  It exposes an interface for controlling the AlienFX
> -	 zones on Alienware machines that don't contain a dedicated AlienFX
> -	 USB MCU such as the X51 and X51-R2.
> -
>  config HUAWEI_WMI
>  	tristate "Huawei WMI laptop extras driver"
>  	depends on ACPI_BATTERY
> @@ -327,169 +315,7 @@ config EEEPC_WMI
>  	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
>  	  here.
>  
> -config DCDBAS
> -	tristate "Dell Systems Management Base Driver"
> -	depends on X86
> -	help
> -	  The Dell Systems Management Base Driver provides a sysfs interface
> -	  for systems management software to perform System Management
> -	  Interrupts (SMIs) and Host Control Actions (system power cycle or
> -	  power off after OS shutdown) on certain Dell systems.
> -
> -	  See <file:Documentation/driver-api/dcdbas.rst> for more details on the driver
> -	  and the Dell systems on which Dell systems management software makes
> -	  use of this driver.
> -
> -	  Say Y or M here to enable the driver for use by Dell systems
> -	  management software such as Dell OpenManage.
> -
> -#
> -# The DELL_SMBIOS driver depends on ACPI_WMI and/or DCDBAS if those
> -# backends are selected. The "depends" line prevents a configuration
> -# where DELL_SMBIOS=y while either of those dependencies =m.
> -#
> -config DELL_SMBIOS
> -	tristate "Dell SMBIOS driver"
> -	depends on DCDBAS || DCDBAS=n
> -	depends on ACPI_WMI || ACPI_WMI=n
> -	help
> -	This provides support for the Dell SMBIOS calling interface.
> -	If you have a Dell computer you should enable this option.
> -
> -	Be sure to select at least one backend for it to work properly.
> -
> -config DELL_SMBIOS_WMI
> -	bool "Dell SMBIOS driver WMI backend"
> -	default y
> -	depends on ACPI_WMI
> -	select DELL_WMI_DESCRIPTOR
> -	depends on DELL_SMBIOS
> -	help
> -	This provides an implementation for the Dell SMBIOS calling interface
> -	communicated over ACPI-WMI.
> -
> -	If you have a Dell computer from >2007 you should say Y here.
> -	If you aren't sure and this module doesn't work for your computer
> -	it just won't load.
> -
> -config DELL_SMBIOS_SMM
> -	bool "Dell SMBIOS driver SMM backend"
> -	default y
> -	depends on DCDBAS
> -	depends on DELL_SMBIOS
> -	help
> -	This provides an implementation for the Dell SMBIOS calling interface
> -	communicated over SMI/SMM.
> -
> -	If you have a Dell computer from <=2017 you should say Y here.
> -	If you aren't sure and this module doesn't work for your computer
> -	it just won't load.
> -
> -config DELL_LAPTOP
> -	tristate "Dell Laptop Extras"
> -	depends on DMI
> -	depends on BACKLIGHT_CLASS_DEVICE
> -	depends on ACPI_VIDEO || ACPI_VIDEO = n
> -	depends on RFKILL || RFKILL = n
> -	depends on SERIO_I8042
> -	depends on DELL_SMBIOS
> -	select POWER_SUPPLY
> -	select LEDS_CLASS
> -	select NEW_LEDS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_AUDIO
> -	help
> -	This driver adds support for rfkill and backlight control to Dell
> -	laptops (except for some models covered by the Compal driver).
> -
> -config DELL_RBTN
> -	tristate "Dell Airplane Mode Switch driver"
> -	depends on ACPI
> -	depends on INPUT
> -	depends on RFKILL
> -	help
> -	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
> -	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRBTN.
> -	  This driver register rfkill device or input hotkey device depending
> -	  on hardware type (hw switch slider or keyboard toggle button). For
> -	  rfkill devices it receive HW switch events and set correct hard
> -	  rfkill state.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-rbtn.
> -
> -config DELL_RBU
> -	tristate "BIOS update support for DELL systems via sysfs"
> -	depends on X86
> -	select FW_LOADER
> -	select FW_LOADER_USER_HELPER
> -	help
> -	 Say m if you want to have the option of updating the BIOS for your
> -	 DELL system. Note you need a Dell OpenManage or Dell Update package (DUP)
> -	 supporting application to communicate with the BIOS regarding the new
> -	 image for the image update to take effect.
> -	 See <file:Documentation/admin-guide/dell_rbu.rst> for more details on the driver.
> -
> -config DELL_SMO8800
> -	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
> -	depends on ACPI
> -	help
> -	  Say Y here if you want to support SMO88XX freefall devices
> -	  on Dell Latitude laptops.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-smo8800.
> -
> -config DELL_WMI
> -	tristate "Dell WMI notifications"
> -	depends on ACPI_WMI
> -	depends on DMI
> -	depends on INPUT
> -	depends on ACPI_VIDEO || ACPI_VIDEO = n
> -	depends on DELL_SMBIOS
> -	select DELL_WMI_DESCRIPTOR
> -	select INPUT_SPARSEKMAP
> -	help
> -	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-wmi.
> -
> -config DELL_WMI_SYSMAN
> -	tristate "Dell WMI-based Systems management driver"
> -	depends on ACPI_WMI
> -	depends on DMI
> -	select NLS
> -	help
> -	  This driver allows changing BIOS settings on many Dell machines from
> -	  2018 and newer without the use of any additional software.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-wmi-sysman.
> -
> -config DELL_WMI_DESCRIPTOR
> -	tristate
> -	depends on ACPI_WMI
> -
> -config DELL_WMI_AIO
> -	tristate "WMI Hotkeys for Dell All-In-One series"
> -	depends on ACPI_WMI
> -	depends on INPUT
> -	select INPUT_SPARSEKMAP
> -	help
> -	  Say Y here if you want to support WMI-based hotkeys on Dell
> -	  All-In-One machines.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-wmi-aio.
> -
> -config DELL_WMI_LED
> -	tristate "External LED on Dell Business Netbooks"
> -	depends on LEDS_CLASS
> -	depends on ACPI_WMI
> -	help
> -	  This adds support for the Latitude 2100 and similar
> -	  notebooks that have an external LED.
> +source "drivers/platform/x86/dell/Kconfig"
>  
>  config AMILO_RFKILL
>  	tristate "Fujitsu-Siemens Amilo rfkill support"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 581475f59819..98ad9bcac293 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -9,7 +9,6 @@ obj-$(CONFIG_ACPI_WMI)		+= wmi.o
>  obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
>  
>  # WMI drivers
> -obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
>  obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
>  obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
> @@ -37,20 +36,7 @@ obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
>  
>  # Dell
> -obj-$(CONFIG_DCDBAS)			+= dcdbas.o
> -obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
> -dell-smbios-objs			:= dell-smbios-base.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
> -obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
> -obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> -obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
> -obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
> -obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
> -obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
> -obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
> -obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
> -obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
> +obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)		+= dell/
>  
>  # Fujitsu
>  obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> new file mode 100644
> index 000000000000..31601679d1cc
> --- /dev/null
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -0,0 +1,207 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Dell X86 Platform Specific Drivers
> +#
> +
> +menuconfig X86_PLATFORM_DRIVERS_DELL
> +	bool "Dell X86 Platform Specific Device Drivers"
> +	default n
> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to get to see options for device drivers for various
> +	  Dell x86 platforms, including vendor-specific laptop extension drivers.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if X86_PLATFORM_DRIVERS_DELL
> +
> +config ALIENWARE_WMI
> +	tristate "Alienware Special feature control"
> +    default m
> +	depends on ACPI
> +	depends on LEDS_CLASS
> +	depends on NEW_LEDS
> +	depends on ACPI_WMI
> +	help
> +	 This is a driver for controlling Alienware BIOS driven
> +	 features.  It exposes an interface for controlling the AlienFX
> +	 zones on Alienware machines that don't contain a dedicated AlienFX
> +	 USB MCU such as the X51 and X51-R2.
> +
> +config DCDBAS
> +	tristate "Dell Systems Management Base Driver"
> +    default m
> +	depends on X86
> +	help
> +	  The Dell Systems Management Base Driver provides a sysfs interface
> +	  for systems management software to perform System Management
> +	  Interrupts (SMIs) and Host Control Actions (system power cycle or
> +	  power off after OS shutdown) on certain Dell systems.
> +
> +	  See <file:Documentation/driver-api/dcdbas.rst> for more details on the driver
> +	  and the Dell systems on which Dell systems management software makes
> +	  use of this driver.
> +
> +	  Say Y or M here to enable the driver for use by Dell systems
> +	  management software such as Dell OpenManage.
> +
> +config DELL_LAPTOP
> +	tristate "Dell Laptop Extras"
> +    default m
> +	depends on DMI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on RFKILL || RFKILL = n
> +	depends on SERIO_I8042
> +	depends on DELL_SMBIOS
> +	select POWER_SUPPLY
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	select LEDS_TRIGGERS
> +	select LEDS_TRIGGER_AUDIO
> +	help
> +	This driver adds support for rfkill and backlight control to Dell
> +	laptops (except for some models covered by the Compal driver).
> +
> +config DELL_RBU
> +	tristate "BIOS update support for DELL systems via sysfs"
> +    default m
> +	depends on X86
> +	select FW_LOADER
> +	select FW_LOADER_USER_HELPER
> +	help
> +	 Say m if you want to have the option of updating the BIOS for your
> +	 DELL system. Note you need a Dell OpenManage or Dell Update package (DUP)
> +	 supporting application to communicate with the BIOS regarding the new
> +	 image for the image update to take effect.
> +	 See <file:Documentation/admin-guide/dell_rbu.rst> for more details on the driver.
> +
> +config DELL_RBTN
> +	tristate "Dell Airplane Mode Switch driver"
> +    default m
> +	depends on ACPI
> +	depends on INPUT
> +	depends on RFKILL
> +	help
> +	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
> +	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRBTN.
> +	  This driver register rfkill device or input hotkey device depending
> +	  on hardware type (hw switch slider or keyboard toggle button). For
> +	  rfkill devices it receive HW switch events and set correct hard
> +	  rfkill state.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-rbtn.
> +
> +#
> +# The DELL_SMBIOS driver depends on ACPI_WMI and/or DCDBAS if those
> +# backends are selected. The "depends" line prevents a configuration
> +# where DELL_SMBIOS=y while either of those dependencies =m.
> +#
> +config DELL_SMBIOS
> +	tristate "Dell SMBIOS driver"
> +    default m
> +	depends on DCDBAS || DCDBAS=n
> +	depends on ACPI_WMI || ACPI_WMI=n
> +	help
> +	This provides support for the Dell SMBIOS calling interface.
> +	If you have a Dell computer you should enable this option.
> +
> +	Be sure to select at least one backend for it to work properly.
> +
> +config DELL_SMBIOS_WMI
> +	bool "Dell SMBIOS driver WMI backend"
> +	default y
> +	depends on ACPI_WMI
> +	select DELL_WMI_DESCRIPTOR
> +	depends on DELL_SMBIOS
> +	help
> +	This provides an implementation for the Dell SMBIOS calling interface
> +	communicated over ACPI-WMI.
> +
> +	If you have a Dell computer from >2007 you should say Y here.
> +	If you aren't sure and this module doesn't work for your computer
> +	it just won't load.
> +
> +config DELL_SMBIOS_SMM
> +	bool "Dell SMBIOS driver SMM backend"
> +	default y
> +	depends on DCDBAS
> +	depends on DELL_SMBIOS
> +	help
> +	This provides an implementation for the Dell SMBIOS calling interface
> +	communicated over SMI/SMM.
> +
> +	If you have a Dell computer from <=2017 you should say Y here.
> +	If you aren't sure and this module doesn't work for your computer
> +	it just won't load.
> +
> +config DELL_SMO8800
> +	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
> +    default m
> +	depends on ACPI
> +	help
> +	  Say Y here if you want to support SMO88XX freefall devices
> +	  on Dell Latitude laptops.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-smo8800.
> +
> +config DELL_WMI
> +	tristate "Dell WMI notifications"
> +    default m
> +	depends on ACPI_WMI
> +	depends on DMI
> +	depends on INPUT
> +	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on DELL_SMBIOS
> +	select DELL_WMI_DESCRIPTOR
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-wmi.
> +
> +config DELL_WMI_AIO
> +	tristate "WMI Hotkeys for Dell All-In-One series"
> +    default m
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y here if you want to support WMI-based hotkeys on Dell
> +	  All-In-One machines.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-wmi-aio.
> +
> +config DELL_WMI_DESCRIPTOR
> +	tristate
> +    default m
> +	depends on ACPI_WMI
> +
> +config DELL_WMI_LED
> +	tristate "External LED on Dell Business Netbooks"
> +    default m
> +	depends on LEDS_CLASS
> +	depends on ACPI_WMI
> +	help
> +	  This adds support for the Latitude 2100 and similar
> +	  notebooks that have an external LED.
> +
> +config DELL_WMI_SYSMAN
> +	tristate "Dell WMI-based Systems management driver"
> +    default m
> +	depends on ACPI_WMI
> +	depends on DMI
> +	select NLS
> +	help
> +	  This driver allows changing BIOS settings on many Dell machines from
> +	  2018 and newer without the use of any additional software.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-wmi-sysman.
> +
> +endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> new file mode 100644
> index 000000000000..d720a3e42ae3
> --- /dev/null
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/dell
> +# Dell x86 Platform-Specific Drivers
> +#
> +
> +obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> +obj-$(CONFIG_DCDBAS)			+= dcdbas.o
> +obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
> +obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
> +obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
> +obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
> +dell-smbios-objs			:= dell-smbios-base.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
> +obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
> +obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
> +obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
> +obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
> +obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
> +obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/alienware-wmi.c
> rename to drivers/platform/x86/dell/alienware-wmi.c
> diff --git a/drivers/platform/x86/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> similarity index 100%
> rename from drivers/platform/x86/dcdbas.c
> rename to drivers/platform/x86/dell/dcdbas.c
> diff --git a/drivers/platform/x86/dcdbas.h b/drivers/platform/x86/dell/dcdbas.h
> similarity index 100%
> rename from drivers/platform/x86/dcdbas.h
> rename to drivers/platform/x86/dell/dcdbas.h
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> similarity index 100%
> rename from drivers/platform/x86/dell-laptop.c
> rename to drivers/platform/x86/dell/dell-laptop.c
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell/dell-rbtn.c
> similarity index 100%
> rename from drivers/platform/x86/dell-rbtn.c
> rename to drivers/platform/x86/dell/dell-rbtn.c
> diff --git a/drivers/platform/x86/dell-rbtn.h b/drivers/platform/x86/dell/dell-rbtn.h
> similarity index 100%
> rename from drivers/platform/x86/dell-rbtn.h
> rename to drivers/platform/x86/dell/dell-rbtn.h
> diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
> similarity index 100%
> rename from drivers/platform/x86/dell-smbios-base.c
> rename to drivers/platform/x86/dell/dell-smbios-base.c
> diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
> similarity index 100%
> rename from drivers/platform/x86/dell-smbios-smm.c
> rename to drivers/platform/x86/dell/dell-smbios-smm.c
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/dell-smbios-wmi.c
> rename to drivers/platform/x86/dell/dell-smbios-wmi.c
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell/dell-smbios.h
> similarity index 100%
> rename from drivers/platform/x86/dell-smbios.h
> rename to drivers/platform/x86/dell/dell-smbios.h
> diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> similarity index 100%
> rename from drivers/platform/x86/dell-smo8800.c
> rename to drivers/platform/x86/dell/dell-smo8800.c
> diff --git a/drivers/platform/x86/dell-wmi-aio.c b/drivers/platform/x86/dell/dell-wmi-aio.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-aio.c
> rename to drivers/platform/x86/dell/dell-wmi-aio.c
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-descriptor.c
> rename to drivers/platform/x86/dell/dell-wmi-descriptor.c
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell/dell-wmi-descriptor.h
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-descriptor.h
> rename to drivers/platform/x86/dell/dell-wmi-descriptor.h
> diff --git a/drivers/platform/x86/dell-wmi-led.c b/drivers/platform/x86/dell/dell-wmi-led.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-led.c
> rename to drivers/platform/x86/dell/dell-wmi-led.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/Makefile b/drivers/platform/x86/dell/dell-wmi-sysman/Makefile
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/Makefile
> rename to drivers/platform/x86/dell/dell-wmi-sysman/Makefile
> diff --git a/drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/biosattr-interface.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/dell-wmi-sysman.h
> rename to drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> diff --git a/drivers/platform/x86/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/enum-attributes.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/passwordattr-interface.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/string-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/string-attributes.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi-sysman/sysman.c
> rename to drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/dell-wmi.c
> rename to drivers/platform/x86/dell/dell-wmi.c
> diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> similarity index 100%
> rename from drivers/platform/x86/dell_rbu.c
> rename to drivers/platform/x86/dell/dell_rbu.c
> 

