Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECF1C46467
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Jan 2023 12:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjAPMGR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Jan 2023 07:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjAPMGQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Jan 2023 07:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204CF196BF
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jan 2023 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673870728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TdXMyq6qFhGIH6cpWmSdnBDJrjh5oL1y4Bla2B/eulE=;
        b=OPaKkkXaxzMLs3oqoXzVG6MWydkB4kmJECSF2RWua+COfLG7QxH2dlI2MOmNCdbz8WcH1X
        jq5EvKIVzaNWEYDh6csKp4/8GqWxjzD0sWlEil2w+LojqB7Ju7dMPOeJjGzjEIeo7+0uGr
        VshXMQ3XGx2y+uMyl0mP5Sni+xrP0s8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-_ZZDVxbMNJGAcD_MeQNTeA-1; Mon, 16 Jan 2023 07:05:25 -0500
X-MC-Unique: _ZZDVxbMNJGAcD_MeQNTeA-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a056402348800b0049e1913bd43so1364938edc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Jan 2023 04:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdXMyq6qFhGIH6cpWmSdnBDJrjh5oL1y4Bla2B/eulE=;
        b=MfmeWISD7e98Jzlhtut9AFF03CbxHzOsjEhAV6picDOPRz80AnhPKFXgqxJJcw/BJo
         63b+ImJCm5+/LUN9HsKncgh3QhW0e8rT3o8f5kxveXr1gkPumkf5oh5S0iYIkbI9MUx+
         OuGbuqfXT6ppJ0+s4qANSiUoL6Aliu28azcAKvpibLInq+WLPueKifj1mMSf+jskEgJy
         KduVvrDYaEzYVd8pdCfQwKaddLid8gGR3aqv18v+9GuD3eeZ94b/EsBUON3/0lvo679u
         MtSvFjQXA8RhAdy0KLyOkteqnsgNhPzh5C/h5C44bF3Lz2Dz5Hv6E838s9VA7q9+liRR
         NYKg==
X-Gm-Message-State: AFqh2koMH17aN7ZVfsBcpPDE2C4oiOzwtPHlYlOi5jezafv6YBmD1GYS
        vzW6+/iDHC8EjegCKLuB6kaFLjvddVNa8r6yPxtxOBVGlTwvai4nZxdkT9HRixw67d2s5peFX+P
        d3x9xfEZ7M+dcxzMzqlyAuPcrLxAZwrEchg==
X-Received: by 2002:a17:906:39d8:b0:847:410:ecff with SMTP id i24-20020a17090639d800b008470410ecffmr71419810eje.16.1673870723337;
        Mon, 16 Jan 2023 04:05:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXub39BHup0aBygGSAju7IJ/I51UHrdF4u5tn2YPs01QQL+zhoq2ZocKXzmvesh0SSP5GTrZYQ==
X-Received: by 2002:a17:906:39d8:b0:847:410:ecff with SMTP id i24-20020a17090639d800b008470410ecffmr71419782eje.16.1673870722943;
        Mon, 16 Jan 2023 04:05:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090615c300b008566b807d8asm7696467ejd.73.2023.01.16.04.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 04:05:22 -0800 (PST)
Message-ID: <f797db3d-feaf-5c03-428e-595ec5f4e3a3@redhat.com>
Date:   Mon, 16 Jan 2023 13:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/5] Introduction of HP-BIOSCFG driver (1)
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
 <20221202173616.180108-2-jorge.lopez2@hp.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202173616.180108-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 12/2/22 18:36, Jorge Lopez wrote:
> The purpose for this patch is submit HP BIOSCFG driver to be list of
> HP Linux kernel drivers.  The driver include a total of 12 files
> broken in several patches.  This is set 1 of 4.
> 
> HP BIOS Configuration driver purpose is to provide a driver supporting
> the latest sysfs class firmware attributes framework allowing the user
> to change BIOS settings and security solutions on HP Inc.’s commercial
> notebooks.
> 
> Many features of HP Commercial PC’s can be managed using Windows
> Management Instrumentation (WMI). WMI is an implementation of Web-Based
> Enterprise Management (WBEM) that provides a standards-based interface
> for changing and monitoring system settings.  HP BISOCFG driver provides
> a native Linux solution and the exposed features facilitates the
> migration to Linux environments.
> 
> The Linux security features to be provided in hp-bioscfg driver enables
> managing the BIOS settings and security solutions via sysfs, a virtual
> filesystem that can be used by user-mode applications.   The new
> documentation cover features such Secure Platform Management, Sure
> Admin, and Sure Start.  Each section provides security feature
> description and identifies sysfs directories and files exposed by
> the driver.
> 
> Many HP Commercial PC’s include a feature called Secure Platform
> Management (SPM), which replaces older password-based BIOS settings
> management with public key cryptography. PC secure product management
> begins when a target system is provisioned with cryptographic keys
> that are used to ensure the integrity of communications between system
> management utilities and the BIOS.
> 
> HP Commercial PC’s have several BIOS settings that control its behaviour
> and capabilities, many of which are related to security. To prevent
> unauthorized changes to these settings, the system can be configured
> to use a Sure Admin cryptographic signature-based authorization string
> that the BIOS will use to verify authorization to modify the setting.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> 
> History
> 
> Version 5
> 	Remove version 4 patch 1
> 	Address review changes proposed in Version 4
> 	Reorganize all patches number and file order
> ---
>  .../testing/sysfs-class-firmware-attributes   | 181 +++++++++++++++++-
>  MAINTAINERS                                   |   6 +
>  drivers/platform/x86/hp/Kconfig               |  16 ++
>  drivers/platform/x86/hp/Makefile              |   1 +
>  drivers/platform/x86/hp/hp-bioscfg/Makefile   |  19 ++

This patch really should be the last patch in the series since
the Makefile points to a bunch of files which don't exist
until the other patches are merged.

>  5 files changed, 221 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 4cdba3477176..da8e06d9bb43 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -22,6 +22,13 @@ Description:
>  			- integer: a range of numerical values
>  			- string
>  
> +		HP specific types
> +		-----------------
> +			- ordered-list - a set of ordered list valid values
> +			- sure-admin
> +			- sure-start
> +
> +
>  		All attribute types support the following values:
>  
>  		current_value:
> @@ -126,6 +133,67 @@ Description:
>  					value will not be effective through sysfs until this rule is
>  					met.
>  
> +		HP specific class extensions
> +		------------------------------
> +
> +		On HP systems the following additional attributes are available:
> +
> +		"ordered-list"-type specific properties:
> +
> +		elements:
> +					A file that can be read to obtain the possible
> +					list of values of the <attr>. Values are separated using
> +					semi-colon (``;``). The order individual elements are listed
> +					according to their priority.  An Element listed first has the
> +					hightest priority. Writing the list in a different order to
> +					current_value alters the priority order for the particular
> +					attribute.

Ok, this new ordered-list type is fine.

> +
> +		"sure-admin"-type specific properties:
> +
> +		settings:
> +					A file associated with Sure Admin. BIOS settings can
> +					be read or written through the Sure Admin settings file in sysfs.
> +
> +					[BIOS setting],[new value],[auth token]
> +
> +					Sample settings reported data
> +
> +					{
> +						"Class": "HPBIOS_BIOSEnumeration",
> +						"Name": "USB Storage Boot",
> +						"Path": "\\Advanced\\Boot Options",
> +						"IsReadOnly": 0,
> +						...
> +						"Value": "Enable",
> +						"Size": 2,
> +						"PossibleValues": [
> +							"Disable",
> +							"Enable"
> +							]
> +					}
> +
> +					This file can also be written to in order to update
> +					the value sof a <attr> using a CMSL generated payload.
> +					For example:
> +
> +					<attr>,[value],[CMSL generated payload]


This is basically a run-around around the actual firmware attributes API,
so NACK for this.

Looking at how sure_admin_settings_write() encodes things I don't see any
difference between how auth-tokens/CFML-payloads are handled vs regular passwords
inside hp_set_attribute().

Except for the BEAM_PREFIX thing, which can be added to calculate_security_buffer() /
populate_security_buffer() too and in that case all 3 of the following should simply
work, taking a boot-delay integer attribute as example:

echo "password" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Password"/current_password
echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/current_value

echo "auth-token" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Password"/current_password
echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/current_value

cat csml-payload.file > /sys/class/firmware-attributes/hp-bioscfg/"Setup Password"/current_password
echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/current_value

The only reason why this would not work is if things may get bigger then the size of a single
memory page (bigger then 4096 bytes).

But in that case you should just change the code implementing current_password to
use the bin_attribute interface and replace the static buffer for storing it
with a pointer to kmalloc-ed memory, which is NULL when the password is not set.

This will also remove a lot of finicky parsing which is currently done inside
sure_admin_settings_write()

###

As for the reading which returns a large large list of data blocks like this:

					{
						"Class": "HPBIOS_BIOSEnumeration",
						"Name": "USB Storage Boot",
						"Path": "\\Advanced\\Boot Options",
						"IsReadOnly": 0,
						...
						"Value": "Enable",
						"Size": 2,
						"PossibleValues": [
							"Disable",
							"Enable"
							]
					}

This sort of thing really does not belong in the kernel. I see that this does
export some info which is not available in the standard firmware-attributes interface,
like path and prerequisites and physical-presence.

If you want to export that info please just add extra HP specific attributes to
the integer, string, etc. attributes sets. Like how Dell has the dell_modifier
thing.

And if you have some consumers for data in the above format then give your users
a shell or python script or small C program which uses the sysfs interface
to output the information in the above format. Generating this format does
not belong in the kernel.


> +
> +		"sure-start"-type specific properties:
> +
> +		audit_log_entries:
> +					A read-only file that returns the events in the log.
> +
> +					Audit log entry format
> +
> +					Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
> +					Byte 16-127: Unused
> +
> +		audit_log_entry_count:
> +					A read-only file that returns the number of existing audit log events available to be read.
> +
> +					[No of entries],[log entry size],[Max number of entries supported]
> +
>  What:		/sys/class/firmware-attributes/*/authentication/
>  Date:		February 2021
>  KernelVersion:	5.11
> @@ -206,7 +274,7 @@ Description:
>  		Drivers may emit a CHANGE uevent when a password is set or unset
>  		userspace may check it again.
>  
> -		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
> +		On Dell, Lenovo, and HP systems, if Admin password is set, then all BIOS attributes
>  		require password validation.
>  		On Lenovo systems if you change the Admin password the new password is not active until
>  		the next boot.
> @@ -296,6 +364,15 @@ Description:
>  						echo "signature" > authentication/Admin/signature
>  						echo "password" > authentication/Admin/certificate_to_password
>  
> +		HP specific class extensions
> +		--------------------------------
> +
> +		On HP systems the following additional settings are available:
> +
> +		role: enhanced-bios-auth:
> +					This role is specific to Secure Platform Management (SPM) attribute.
> +					It requires configuring an endorsement (kek) and signing certificate (sk).
> +
>  
>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>  Date:		February 2021
> @@ -311,7 +388,7 @@ Description:
>  			==	=========================================
>  			0	All BIOS attributes setting are current
>  			1	A reboot is necessary to get pending BIOS
> -			        attribute changes applied
> +				attribute changes applied
>  			==	=========================================
>  
>  		Note, userspace applications need to follow below steps for efficient
> @@ -364,3 +441,103 @@ Description:
>  		use it to enable extra debug attributes or BIOS features for testing purposes.
>  
>  		Note that any changes to this attribute requires a reboot for changes to take effect.
> +
> +
> +		HP specific class extensions
> +		--------------------------------
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'kek' is a write-only file that can be used to configure the
> +		RSA public key that will be used by the BIOS to verify
> +		signatures when setting the signing key.  When written,
> +		the bytes should correspond to the KEK certificate
> +		(x509 .DER format containing an OU).  The size of the
> +		certificate must be less than or equal to 4095 bytes.
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/sk
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'sk' is a write-only file that can be used to configure the RSA
> +		public key that will be used by the BIOS to verify signatures
> +		when configuring BIOS settings and security features.  When
> +		written, the bytes should correspond to the modulus of the
> +		public key.  The exponent is assumed to be 0x10001.
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/status
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'status' is a read-only file that returns ASCII text reporting
> +		the status information.
> +
> +		  State:  Not Provisioned / Provisioned / Provisioning in progress
> +		  Version:  Major.   Minor
> +		  Feature Bit Mask: <16-bit unsigned number display in hex>
> +		  SPM Counter: <16-bit unsigned number display in base 10>
> +		  Signing Key Public Key Modulus (base64):
> +		  KEK Public Key Modulus (base64):
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/statusbin
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'statusbin' is a read-only file that returns identical status
> +		information reported by 'status' file in binary format.

The above is all fine.


The sure-admin thing needs to go away as already mentioned.

> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Admin/settings
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'settings' is a file associated with Sure Admin. BIOS settings can
> +		be read or written through the Sure Admin settings file in sysfs.
> +
> +		Expected data format to update BIOS setting
> +
> +		  [BIOS setting],[new value],[auth token]
> +
> +		Sample settings reported data
> +
> +		  {
> +			  "Class": "HPBIOS_BIOSEnumeration",
> +			  "Name": "USB Storage Boot",
> +			  "Path": "\\Advanced\\Boot Options",
> +			  "IsReadOnly": 0,
> +			  ...
> +			  "Value": "Enable",
> +			  "Size": 2,
> +			  "PossibleValues": [
> +				"Disable",
> +				"Enable"
> +				]
> +		  }
> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entry_count
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	audit_log_entry_count is a read-only file that returns the
> +		number of existing audit log events available to be read.
> +
> +		  [No of entries],[log entry size],[Max number of entries supported]
> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entries
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	audit_log_entries is a read-only file that returns the events
> +		in the log.
> +
> +		Audit log entry format
> +
> +		  Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
> +		  Byte 16-127: Unused


This audit_log info is duplicate with the documentation already added for this above,
please drop these entries.



> diff --git a/MAINTAINERS b/MAINTAINERS
> index 893c63e8beef..6cc9dd0c9ec2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9363,6 +9363,12 @@ S:	Obsolete
>  W:	http://w1.fi/hostap-driver.html
>  F:	drivers/net/wireless/intersil/hostap/
>  
> +HP BIOSCFG DRIVER
> +M:	Jorge Lopez <jorge.lopez2@hp.com>
> +S:	Maintained
> +L:      platform-driver-x86@vger.kernel.org
> +F:	drivers/platform/x86/hp/hp-bioscfg/
> +
>  HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Orphan
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> index ae165955311c..7fef4f12e498 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -60,4 +60,20 @@ config TC1100_WMI
>  	  This is a driver for the WMI extensions (wireless and bluetooth power
>  	  control) of the HP Compaq TC1100 tablet.
>  
> +config HP_BIOSCFG
> +	tristate "HP BIOS Configuration Driver"
> +	default m
> +	depends on ACPI_WMI
> +	select NLS
> +	select FW_ATTR_CLASS
> +	help
> +	  This driver enables administrators to securely manage BIOS settings
> +	  using digital certificates and public-key cryptography that eliminate
> +	  the need for passwords for both remote and local management. It supports
> +	  changing BIOS settings on many HP machines from 2018 and newer without
> +	  the use of any additional software.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called hp-bioscfg.
> +
>  endif # X86_PLATFORM_DRIVERS_HP
> diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
> index db1eed4cd7c7..e4f908a61acf 100644
> --- a/drivers/platform/x86/hp/Makefile
> +++ b/drivers/platform/x86/hp/Makefile
> @@ -8,3 +8,4 @@
>  obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
>  obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
>  obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
> +obj-$(CONFIG_HP_BIOSCFG)	+= hp-bioscfg/
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/Makefile b/drivers/platform/x86/hp/hp-bioscfg/Makefile
> new file mode 100644
> index 000000000000..cc1a613f9223
> --- /dev/null
> +++ b/drivers/platform/x86/hp/hp-bioscfg/Makefile
> @@ -0,0 +1,19 @@
> +obj-$(CONFIG_HP_BIOSCFG) := hp-bioscfg.o
> +
> +hp-bioscfg-objs := bioscfg.o	\
> +	enum-attributes.o	\
> +	int-attributes.o	\
> +	string-attributes.o	\
> +	passwdobj-attributes.o	\
> +	biosattr-interface.o	\
> +	passwdattr-interface.o	\
> +	ordered-attributes.o	\
> +	surestart-attributes.o	\
> +	spmobj-attributes.o	\
> +	sureadmin-attributes.o

Everything below here:

> +
> +default:
> +	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
> +
> +clean:
> +	make -C /lib/modules/`uname -r`/build M=$(PWD) clean

Does not belong here, please drop it.

Regards,

Hans

