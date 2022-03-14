Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B556C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 15:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239156AbiCNPQh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 11:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiCNPQf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 11:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DF966339
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647270922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZlvhgASF5RrFGKSwColfavYL0QMnXhzl67In4HMQDeI=;
        b=hnwbv8bLu4WHsTaMKn0FsKAczP48MVCpBna+xtIr8uQOFqOhZEAHKj4KougPkARU7VFTof
        z7l+bmFzDZbvVSefmyxEfYf+vhNuyCmASp31orSWBqLefZTK1tZ6TWMK/AbCzzQGxWpnZ2
        wJgMyS2UCtDCnSUJ7R+pXB92LWBsvD8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-OABYKxqWNnmJB-s1fht3fg-1; Mon, 14 Mar 2022 11:15:18 -0400
X-MC-Unique: OABYKxqWNnmJB-s1fht3fg-1
Received: by mail-ed1-f72.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so8946061edw.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 08:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZlvhgASF5RrFGKSwColfavYL0QMnXhzl67In4HMQDeI=;
        b=krOeeQWKlTfwigKvUYY1D45daDM/Sp64MxPIQaluqocjy8AspKe0sC5wb8FpgGV9sQ
         ltXhYTObHt1u7EfnfDjOKLTlCMfOi22LvwXeAVqz5jODjXgGL528nFgLl20sN2i8xYa4
         a+7tfR9t4eRQiRJlFDQ/oqjPVZGGTiJ/5w8pt58nW1FaBpm4n0q/JLj8RVEbvgyKK2bm
         kh8OkNcV+fsBXulZBm4nA7h2oFxQ95KBM6I7ggiGT1c66tA/p2rJxq5Fj49WwgQoqRkC
         MpKm13nFoBe3GpxzNuXDFNNTw5v1n/+Dd/rP8zziAG1aSi/I7JXsNoRgy3/1kp4g1EMV
         SNnw==
X-Gm-Message-State: AOAM531H5NGJXlmfS9Y2EBUnKwnYJ2WqRnL7N1kNnHvAWx8UByPAHzDz
        mJpCl4U2cVQ2qEdPFNP8rQAjp6tOSFXPoShRpU6MDSK9JdA/Eu5+yT9nQknsR9IbdPisc83hRkz
        O3dePwW8UZVpz+oe+QgO4kNBIHK048PXTwA==
X-Received: by 2002:a17:906:d554:b0:6da:8a8e:2f2 with SMTP id cr20-20020a170906d55400b006da8a8e02f2mr19016793ejc.434.1647270917250;
        Mon, 14 Mar 2022 08:15:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz3ZS4x+I/tCV1ML1VEyNP1HUzuOe5Z0V2KOH4OKMu3+B8MNHcxasCWqjLs0yMClpUqYAa5Q==
X-Received: by 2002:a17:906:d554:b0:6da:8a8e:2f2 with SMTP id cr20-20020a170906d55400b006da8a8e02f2mr19016764ejc.434.1647270916727;
        Mon, 14 Mar 2022 08:15:16 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id er12-20020a056402448c00b00413d03ac4a2sm7776349edb.69.2022.03.14.08.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 08:15:16 -0700 (PDT)
Message-ID: <7f8a13f6-8615-b952-5523-e13bbc4b98be@redhat.com>
Date:   Mon, 14 Mar 2022 16:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] platform/x86: think-lmi: Certificate authentication
 support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220312000439.4143-1-markpearson@lenovo.com>
 <20220312000439.4143-2-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220312000439.4143-2-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/12/22 01:04, Mark Pearson wrote:
> Implementation of certificate authentication feature for Lenovo
> platforms. This allows for signed updates of BIOS settings.
> 
> Functionality supported:
>  - Cert support available check. At initialisation check if BIOS
>    supports certification authentication and if a certificate is
>    installed. Enable the sysfs nodes appropriately
>  - certificate and signature authentication attributes to enable
>    a user to install, update and delete a certificate using signed
>    signatures
>  - certificate_thumbprint to confirm installed certificate details
>  - support to go from certificate to password based authentication
>  - set_signature and save_signature attributes needed for setting
>    BIOS attributes using certificate authentication
> 
> Tested on X1 Carbon 10 with special trial BIOS. This feature is not
> generally available yet but will be released later this year.
> 
> Note, I also cleaned up the formating of the GUIDs when I was adding
> the new defines. Hope that's OK to combine in this commit.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/think-lmi.c | 560 ++++++++++++++++++++++++++-----
>  drivers/platform/x86/think-lmi.h |   7 +
>  2 files changed, 475 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 0b73e16cccea..54ce71f97c37 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -16,6 +16,7 @@
>  #include <linux/fs.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/dmi.h>
>  #include <linux/wmi.h>
>  #include "firmware_attributes_class.h"
>  #include "think-lmi.h"
> @@ -25,95 +26,66 @@ module_param(debug_support, bool, 0444);
>  MODULE_PARM_DESC(debug_support, "Enable debug command support");
>  
>  /*
> - * Name:
> - *  Lenovo_BiosSetting
> - * Description:
> - *  Get item name and settings for current LMI instance.
> - * Type:
> - *  Query
> - * Returns:
> - *  "Item,Value"
> - * Example:
> - *  "WakeOnLAN,Enable"
> + * Name: BiosSetting
> + * Description: Get item name and settings for current LMI instance.
> + * Type: Query
> + * Returns: "Item,Value"
> + * Example: "WakeOnLAN,Enable"
>   */
>  #define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
>  
>  /*
> - * Name:
> - *  Lenovo_SetBiosSetting
> - * Description:
> - *  Change the BIOS setting to the desired value using the Lenovo_SetBiosSetting
> - *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
> + * Name: SetBiosSetting
> + * Description: Change the BIOS setting to the desired value using the SetBiosSetting
> + *  class. To save the settings, use the SaveBiosSetting class.
>   *  BIOS settings and values are case sensitive.
>   *  After making changes to the BIOS settings, you must reboot the computer
>   *  before the changes will take effect.
> - * Type:
> - *  Method
> - * Arguments:
> - *  "Item,Value,Password,Encoding,KbdLang;"
> - * Example:
> - *  "WakeOnLAN,Disable,pa55w0rd,ascii,us;"
> + * Type: Method
> + * Arguments: "Item,Value,Password,Encoding,KbdLang;"
> + * Example: "WakeOnLAN,Disable,pa55w0rd,ascii,us;"
>   */
>  #define LENOVO_SET_BIOS_SETTINGS_GUID "98479A64-33F5-4E33-A707-8E251EBBC3A1"
>  
>  /*
> - * Name:
> - *  Lenovo_SaveBiosSettings
> - * Description:
> - *  Save any pending changes in settings.
> - * Type:
> - *  Method
> - * Arguments:
> - *  "Password,Encoding,KbdLang;"
> - * Example:
> - * "pa55w0rd,ascii,us;"
> + * Name: SaveBiosSettings
> + * Description: Save any pending changes in settings.
> + * Type: Method
> + * Arguments: "Password,Encoding,KbdLang;"
> + * Example: "pa55w0rd,ascii,us;"
>   */
>  #define LENOVO_SAVE_BIOS_SETTINGS_GUID "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
>  
>  /*
> - * Name:
> - *  Lenovo_BiosPasswordSettings
> - * Description:
> - *  Return BIOS Password settings
> - * Type:
> - *  Query
> - * Returns:
> - *  PasswordMode, PasswordState, MinLength, MaxLength,
> + * Name: BiosPasswordSettings
> + * Description: Return BIOS Password settings
> + * Type: Query
> + * Returns: PasswordMode, PasswordState, MinLength, MaxLength,
>   *  SupportedEncoding, SupportedKeyboard
>   */
>  #define LENOVO_BIOS_PASSWORD_SETTINGS_GUID "8ADB159E-1E32-455C-BC93-308A7ED98246"
>  
>  /*
> - * Name:
> - *  Lenovo_SetBiosPassword
> - * Description:
> - *  Change a specific password.
> + * Name: SetBiosPassword
> + * Description: Change a specific password.
>   *  - BIOS settings cannot be changed at the same boot as power-on
>   *    passwords (POP) and hard disk passwords (HDP). If you want to change
>   *    BIOS settings and POP or HDP, you must reboot the system after changing
>   *    one of them.
>   *  - A password cannot be set using this method when one does not already
>   *    exist. Passwords can only be updated or cleared.
> - * Type:
> - *  Method
> - * Arguments:
> - *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
> - * Example:
> - *  "pop,pa55w0rd,newpa55w0rd,ascii,us;”
> + * Type: Method
> + * Arguments: "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
> + * Example: "pop,pa55w0rd,newpa55w0rd,ascii,us;”
>   */
>  #define LENOVO_SET_BIOS_PASSWORD_GUID "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
>  
>  /*
> - * Name:
> - *  Lenovo_GetBiosSelections
> - * Description:
> - *  Return a list of valid settings for a given item.
> - * Type:
> - *  Method
> - * Arguments:
> - *  "Item"
> - * Returns:
> - *  "Value1,Value2,Value3,..."
> + * Name: GetBiosSelections
> + * Description: Return a list of valid settings for a given item.
> + * Type: Method
> + * Arguments: "Item"
> + * Returns: "Value1,Value2,Value3,..."
>   * Example:
>   *  -> "FlashOverLAN"
>   *  <- "Enabled,Disabled"
> @@ -121,18 +93,14 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>  #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
>  
>  /*
> - * Name:
> - *  Lenovo_DebugCmdGUID
> - * Description
> - *  Debug entry GUID method for entering debug commands to the BIOS
> + * Name: DebugCmd
> + * Description: Debug entry method for entering debug commands to the BIOS
>   */
>  #define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
>  
>  /*
> - * Name:
> - *  Lenovo_OpcodeIF
> - * Description:
> - *  Opcode interface which provides the ability to set multiple
> + * Name: OpcodeIF
> + * Description: Opcode interface which provides the ability to set multiple
>   *  parameters and then trigger an action with a final command.
>   *  This is particularly useful for simplifying setting passwords.
>   *  With this support comes the ability to set System, HDD and NVMe
> @@ -141,10 +109,71 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>   */
>  #define LENOVO_OPCODE_IF_GUID "DFDDEF2C-57D4-48ce-B196-0FB787D90836"
>  
> +/*
> + * Name: SetBiosCert
> + * Description: Install BIOS certificate.
> + * Type: Method
> + * Arguments: "Certificate,Password"
> + * You must reboot the computer before the changes will take effect.
> + */
> +#define LENOVO_SET_BIOS_CERT_GUID    "26861C9F-47E9-44C4-BD8B-DFE7FA2610FE"
> +
> +/*
> + * Name: UpdateBiosCert
> + * Description: Update BIOS certificate.
> + * Type: Method
> + * Format: "Certificate,Signature"
> + * You must reboot the computer before the changes will take effect.
> + */
> +#define LENOVO_UPDATE_BIOS_CERT_GUID "9AA3180A-9750-41F7-B9F7-D5D3B1BAC3CE"
> +
> +/*
> + * Name: ClearBiosCert
> + * Description: Uninstall BIOS certificate.
> + * Type: Method
> + * Format: "Serial,Signature"
> + * You must reboot the computer before the changes will take effect.
> + */
> +#define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DEC44890"
> +/*
> + * Name: CertToPassword
> + * Description: Switch from certificate to password authentication.
> + * Type: Method
> + * Format: "Password,Signature"
> + * You must reboot the computer before the changes will take effect.
> + */
> +#define LENOVO_CERT_TO_PASSWORD_GUID "0DE8590D-5510-4044-9621-77C227F5A70D"
> +
> +/*
> + * Name: SetBiosSettingCert
> + * Description: Set attribute using certificate authentication.
> + * Type: Method
> + * Format: "Item,Value,Signature"
> + */
> +#define LENOVO_SET_BIOS_SETTING_CERT_GUID  "34A008CC-D205-4B62-9E67-31DFA8B90003"
> +
> +/*
> + * Name: SaveBiosSettingCert
> + * Description: Save any pending changes in settings.
> + * Type: Method
> + * Format: "Signature"
> + */
> +#define LENOVO_SAVE_BIOS_SETTING_CERT_GUID "C050FB9D-DF5F-4606-B066-9EFC401B2551"
> +
> +/*
> + * Name: CertThumbprint
> + * Description: Display Certificate thumbprints
> + * Type: Query
> + * Returns: MD5, SHA1 & SHA256 thumbprints
> + */
> +#define LENOVO_CERT_THUMBPRINT_GUID "C59119ED-1C0D-4806-A8E9-59AA318176C4"
> +
>  #define TLMI_POP_PWD (1 << 0)
>  #define TLMI_PAP_PWD (1 << 1)
>  #define TLMI_HDD_PWD (1 << 2)
>  #define TLMI_SYS_PWD (1 << 3)
> +#define TLMI_CERT    (1 << 7)
> +
>  #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
>  #define to_tlmi_attr_setting(kobj)  container_of(kobj, struct tlmi_attr_setting, kobj)
>  
> @@ -608,18 +637,249 @@ static ssize_t level_store(struct kobject *kobj,
>  
>  static struct kobj_attribute auth_level = __ATTR_RW(level);
>  
> +static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
> +{
> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	const union acpi_object *obj;
> +	acpi_status status;
> +
> +	output.length = ACPI_ALLOCATE_BUFFER;
> +	output.pointer = NULL;

This initialization of output is redundant, it is already initialized
when it is declared.

> +
> +	status = wmi_evaluate_method(LENOVO_CERT_THUMBPRINT_GUID, 0, 0, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +	obj = output.pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +	count += sysfs_emit_at(buf, count, "%s : %s\n", arg, (char *)obj->string.pointer);
> +	kfree(output.pointer);
> +
> +	return count;
> +}
> +
> +static ssize_t certificate_thumbprint_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	int count = 0;
> +
> +	if (!tlmi_priv.certificate_support || !setting->cert_installed)
> +		return -EOPNOTSUPP;
> +
> +	count += cert_thumbprint(buf, "Md5", count);
> +	count += cert_thumbprint(buf, "Sha1", count);
> +	count += cert_thumbprint(buf, "Sha256", count);
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_cert_thumb = __ATTR_RO(certificate_thumbprint);
> +
> +static ssize_t cert_to_password_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	char *auth_str, *passwd, *p;
> +	int ret;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.certificate_support)
> +		return -EOPNOTSUPP;
> +
> +	if (!setting->cert_installed)
> +		return -EINVAL;
> +
> +	if (!setting->signature || !setting->signature[0])
> +		return -EACCES;
> +
> +	passwd = kstrdup(buf, GFP_KERNEL);
> +	if (!passwd)
> +		return -ENOMEM;
> +
> +	/* Strip out CR if one is present */
> +	p = strchrnul(passwd, '\n');
> +	*p = '\0';
> +
> +	/* Format: 'Password,Signature' */
> +	auth_str = kasprintf(GFP_KERNEL, "%s,%s", passwd, setting->signature);
> +	if (!auth_str) {
> +		kfree(passwd);
> +		return -ENOMEM;
> +	}
> +	ret = tlmi_simple_call(LENOVO_CERT_TO_PASSWORD_GUID, auth_str);
> +	kfree(auth_str);
> +	kfree(passwd);
> +
> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute auth_cert_to_password = __ATTR_WO(cert_to_password);
> +
> +static ssize_t certificate_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	char *auth_str, *new_cert, *p;
> +	int ret;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.certificate_support)
> +		return -EOPNOTSUPP;
> +
> +	new_cert = kstrdup(buf, GFP_KERNEL);
> +	if (!new_cert)
> +		return -ENOMEM;
> +	/* Strip out CR if one is present */
> +	p = strchrnul(new_cert, '\n');
> +	*p = '\0';
> +
> +	/* If empty then clear installed certificate */
> +	if (new_cert[0] == '\0') { /* Clear installed certificate */

You don't need new_cert anymore here, so do:

		kfree(new_cert);

here.

> +		/* Check that signature is set */
> +		if (!setting->signature || !setting->signature[0]) {
> +			kfree(new_cert);

and drop it here,

> +			return -EACCES;
> +		}
> +		/* Format: 'serial#, signature' */
> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> +				dmi_get_system_info(DMI_PRODUCT_SERIAL),
> +				setting->signature);
> +		if (!auth_str) {
> +			kfree(new_cert);

and here.

> +			return -ENOMEM;
> +		}
> +		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
> +		kfree(auth_str);

Because you were missing a kfree(new_cert) here. Also you should free + clear
setting->certificate here. So this if block should end up like this:

	/* If empty then clear installed certificate */
	if (new_cert[0] == '\0') { /* Clear installed certificate */
		kfree(new_cert);

		/* Check that signature is set */
		if (!setting->signature || !setting->signature[0])
			return -EACCES;

		/* Format: 'serial#, signature' */
		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
				dmi_get_system_info(DMI_PRODUCT_SERIAL),
				setting->signature);
		if (!auth_str)
			return -ENOMEM;

		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
		kfree(auth_str);
		if (ret)
			return ret;

		kfree(setting->certificate);
		setting->certificate = NULL;
		return count;
	}


> +	}
> +
> +	if (setting->cert_installed) {
> +		/* Certificate is installed so this is an update */
> +		if (!setting->signature || !setting->signature[0]) {
> +			kfree(new_cert);
> +			return -EACCES;
> +		}
> +		/* Format: 'Certificate,Signature' */
> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> +				new_cert, setting->signature);> +		if (!auth_str) {
> +			kfree(new_cert);
> +			return -ENOMEM;
> +		}
> +		ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
> +		kfree(auth_str);
> +	} else {
> +		/* This is a fresh install */
> +		if (!setting->valid || !setting->password[0]) {
> +			kfree(new_cert);
> +			return -EACCES;
> +		}
> +		/* Format: 'Certificate,Admin-password' */
> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
> +				new_cert, setting->password);
> +		if (!auth_str) {
> +			kfree(new_cert);
> +			return -ENOMEM;
> +		}
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_CERT_GUID, auth_str);
> +		kfree(auth_str);
> +	}
> +
> +	/* If successful update stored certificate */
> +	if (!ret) {
> +		kfree(setting->certificate);
> +		setting->certificate = new_cert;
> +	} else
> +		kfree(new_cert);
> +
> +	return ret ?: count;

You have 2 "if (ret)" statements here (1 hidden in the return), please change this to:

	if (ret) {
		kfree(new_cert);
		return ret;
	}

	kfree(setting->certificate);
	setting->certificate = new_cert;
	return count;


> +}
> +
> +static ssize_t certificate_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +

setting->certificate may be NULL here, you need to check for that and in
that case only emit a "\n" I guess.

> +	return sysfs_emit(buf, "%s\n", setting->certificate);
> +}
> +
> +static struct kobj_attribute auth_certificate = __ATTR_RW(certificate);
> +
> +static ssize_t signature_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	char *new_signature, *p;
> +	int ret;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.certificate_support)
> +		return -EOPNOTSUPP;
> +
> +	new_signature = kstrdup(buf, GFP_KERNEL);
> +	if (!new_signature)
> +		return -ENOMEM;
> +
> +	/* Strip out CR if one is present */
> +	p = strchrnul(new_signature, '\n');
> +	*p = '\0';

Idea for a follow-up clean-up patch: this pattern of kstrdup user-argument
(buf) + strip '\n' is repeated all over the driver, maybe add a little helper
for this?

> +
> +	/* Free any previous signature */
> +	kfree(setting->signature);
> +	setting->signature = new_signature;
> +
> +	return ret ?: count;
> +}
> +
> +static ssize_t signature_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +

setting->signature can be NULL here.

> +	return sysfs_emit(buf, "%s\n", setting->signature);
> +}
> +
> +static struct kobj_attribute auth_signature = __ATTR_RW(signature);
> +
>  static umode_t auth_attr_is_visible(struct kobject *kobj,
>  					     struct attribute *attr, int n)
>  {
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  
> -	/*We only want to display level and index settings on HDD/NVMe */
> +	/* We only want to display level and index settings on HDD/NVMe */
>  	if ((attr == (struct attribute *)&auth_index) ||
>  			(attr == (struct attribute *)&auth_level)) {
>  		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
>  			return attr->mode;
>  		return 0;
>  	}
> +
> +	/* We only display certificates on Admin account, if supported */
> +	if ((attr == (struct attribute *)&auth_certificate) ||
> +			(attr == (struct attribute *)&auth_signature) ||
> +			(attr == (struct attribute *)&auth_cert_thumb) ||
> +			(attr == (struct attribute *)&auth_cert_to_password)) {
> +		if ((setting == tlmi_priv.pwd_admin) && tlmi_priv.certificate_support)
> +			return attr->mode;
> +		return 0;
> +	}
> +
>  	return attr->mode;
>  }
>  
> @@ -635,6 +895,10 @@ static struct attribute *auth_attrs[] = {
>  	&auth_kbdlang.attr,
>  	&auth_index.attr,
>  	&auth_level.attr,
> +	&auth_certificate.attr,
> +	&auth_signature.attr,
> +	&auth_cert_thumb.attr,
> +	&auth_cert_to_password.attr,
>  	NULL
>  };
>  
> @@ -703,37 +967,58 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	p = strchrnul(new_setting, '\n');
>  	*p = '\0';
>  
> -	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> -		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> -				tlmi_priv.pwd_admin->password,
> -				encoding_options[tlmi_priv.pwd_admin->encoding],
> -				tlmi_priv.pwd_admin->kbdlang);
> -		if (!auth_str) {
> +	/* Check if certificate authentication is enabled and active */
> +	if (tlmi_priv.certificate_support && tlmi_priv.pwd_admin->cert_installed) {
> +		if (!tlmi_priv.set_signature || !tlmi_priv.save_signature) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
> +					new_setting, tlmi_priv.set_signature);
> +		if (!set_str) {
>  			ret = -ENOMEM;
>  			goto out;
>  		}
> -	}
>  
> -	if (auth_str)
> -		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
> -				new_setting, auth_str);
> -	else
> -		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> -				new_setting);
> -	if (!set_str) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTING_CERT_GUID, set_str);
> +		if (ret)
> +			goto out;
> +		ret = tlmi_simple_call(LENOVO_SAVE_BIOS_SETTING_CERT_GUID,
> +				tlmi_priv.save_signature);
> +		if (ret)
> +			goto out;
> +	} else { /* Non certiifcate based authentication */
> +		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> +			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> +					tlmi_priv.pwd_admin->password,
> +					encoding_options[tlmi_priv.pwd_admin->encoding],
> +					tlmi_priv.pwd_admin->kbdlang);
> +			if (!auth_str) {
> +				ret = -ENOMEM;
> +				goto out;
> +			}
> +		}
>  
> -	ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> -	if (ret)
> -		goto out;
> +		if (auth_str)
> +			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
> +					new_setting, auth_str);
> +		else
> +			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> +					new_setting);
> +		if (!set_str) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  
> -	if (auth_str)
> -		ret = tlmi_save_bios_settings(auth_str);
> -	else
> -		ret = tlmi_save_bios_settings("");
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> +		if (ret)
> +			goto out;
>  
> +		if (auth_str)
> +			ret = tlmi_save_bios_settings(auth_str);
> +		else
> +			ret = tlmi_save_bios_settings("");
> +	}
>  	if (!ret && !tlmi_priv.pending_changes) {
>  		tlmi_priv.pending_changes = true;
>  		/* let userland know it may need to check reboot pending again */
> @@ -823,6 +1108,63 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
>  
>  static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>  
> +static ssize_t attr_signature_store(bool set_sig, const char *buf)
> +{
> +	char *new_signature, *p;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.certificate_support)
> +		return -EOPNOTSUPP;
> +
> +	new_signature = kstrdup(buf, GFP_KERNEL);
> +	if (!new_signature)
> +		return -ENOMEM;
> +
> +	/* Strip out CR if one is present */
> +	p = strchrnul(new_signature, '\n');
> +	*p = '\0';
> +
> +	/* Free any previous signature */
> +	kfree(set_sig ? tlmi_priv.set_signature : tlmi_priv.save_signature);
> +	if (set_sig)
> +		tlmi_priv.set_signature = new_signature;
> +	else
> +		tlmi_priv.save_signature = new_signature;
> +
> +	return 0;
> +}
> +
> +static ssize_t set_signature_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	return attr_signature_store(true /*set_sig*/, buf) ?: count;
> +}
> +
> +static ssize_t save_signature_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	return attr_signature_store(false /*set_sig*/, buf) ?: count;
> +}
> +
> +static ssize_t set_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", tlmi_priv.set_signature);
> +}
> +
> +static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", tlmi_priv.save_signature);
> +}
> +
> +static struct kobj_attribute attr_set_signature = __ATTR_RW(set_signature);
> +static struct kobj_attribute attr_save_signature = __ATTR_RW(save_signature);

<note I missed this while reviewing the documentation patch...>

Why not just use the /sys/class/firmware-attributes/thinklmi/authentication/Admin/signature
value here ?

/sys/class/firmware-attributes/thinklmi/authentication/Admin/current_password is
what is used for password based setting of fw-attributes as well as for changing
the password; and

/sys/class/firmware-attributes/thinklmi/authentication/Admin/signature is set
for changing the certificate, so it would be much more consitent to also use
that for setting attributes when using certificate based auth?

Can / will the set and save signature ever be different from one another ? If yes
then I guess we may need 2 attributes for this, I guess maybe just signature +
save_signature ? Either way IMHO these 2 attributes / the 1 extra attribute
for a separate save-signature really belongs under
/sys/class/firmware-attributes/thinklmi/authentication/Admin/ IMHO and
not under /sys/class/firmware-attributes/thinklmi/attributes/

What do you think about moving these there ?

Regards,

Hans




> +
>  /* ---- Debug interface--------------------------------------------------------- */
>  static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr,
>  				const char *buf, size_t count)
> @@ -896,8 +1238,21 @@ static void tlmi_release_attr(void)
>  	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>  	if (tlmi_priv.can_debug_cmd && debug_support)
>  		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
> +	if (tlmi_priv.certificate_support) {
> +		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj,
> +				&attr_set_signature.attr);
> +		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj,
> +				&attr_save_signature.attr);
> +	}
>  	kset_unregister(tlmi_priv.attribute_kset);
>  
> +	if (tlmi_priv.certificate_support) {
> +		kfree(tlmi_priv.pwd_admin->certificate);
> +		kfree(tlmi_priv.pwd_admin->signature);
> +		kfree(tlmi_priv.set_signature);
> +		kfree(tlmi_priv.save_signature);
> +	}
> +
>  	/* Authentication structures */
>  	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_admin->kobj);
> @@ -975,6 +1330,17 @@ static int tlmi_sysfs_init(void)
>  		if (ret)
>  			goto fail_create_attr;
>  	}
> +	if (tlmi_priv.certificate_support) {
> +		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj,
> +				&attr_set_signature.attr);
> +		if (ret)
> +			goto fail_create_attr;
> +		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj,
> +				&attr_save_signature.attr);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
> +
>  	/* Create authentication entries */
>  	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
>  								&tlmi_priv.class_dev->kobj);
> @@ -1087,6 +1453,11 @@ static int tlmi_analyze(void)
>  	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
>  		tlmi_priv.opcode_support = true;
>  
> +	if (wmi_has_guid(LENOVO_SET_BIOS_CERT_GUID) &&
> +		wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
> +		wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
> +		tlmi_priv.certificate_support = true;
> +
>  	/*
>  	 * Try to find the number of valid settings of this machine
>  	 * and use it to create sysfs attributes.
> @@ -1198,6 +1569,11 @@ static int tlmi_analyze(void)
>  			}
>  		}
>  	}
> +
> +	if (tlmi_priv.certificate_support &&
> +		(tlmi_priv.pwdcfg.core.password_state & TLMI_CERT))
> +		tlmi_priv.pwd_admin->cert_installed = true;
> +
>  	return 0;
>  
>  fail_clear_attr:
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index e46c7f383353..47c11b006f6c 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -62,6 +62,9 @@ struct tlmi_pwd_setting {
>  	char kbdlang[TLMI_LANG_MAXLEN];
>  	int index; /*Used for HDD and NVME auth */
>  	enum level_option level;
> +	bool cert_installed;
> +	char *certificate;
> +	char *signature;
>  };
>  
>  /* Attribute setting details */
> @@ -82,6 +85,7 @@ struct think_lmi {
>  	bool pending_changes;
>  	bool can_debug_cmd;
>  	bool opcode_support;
> +	bool certificate_support;
>  
>  	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>  	struct device *class_dev;
> @@ -94,6 +98,9 @@ struct think_lmi {
>  	struct tlmi_pwd_setting *pwd_system;
>  	struct tlmi_pwd_setting *pwd_hdd;
>  	struct tlmi_pwd_setting *pwd_nvme;
> +
> +	char *set_signature;
> +	char *save_signature;
>  };
>  
>  #endif /* !_THINK_LMI_H_ */

