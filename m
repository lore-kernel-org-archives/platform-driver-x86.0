Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD66C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 16:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbiCNQxt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 12:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbiCNQxp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 12:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 552B131DE7
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647276754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UW4PA0HusSRlTEBiDBr9SYC11FMJgDOAGkeboPMyYyU=;
        b=XZ1IMvMXb0xPTeT7sLx0p6t7BpOk147rBsOPhuKZ1mTXN+4X41mNCXm6xKBIMOd58nqbwI
        m/Kr2vRZPflHZJyOXG3kHSk+Y5YP+BtStqcLutHZRNyVQrxZ7kIjoE3te9XMqclinoQU1y
        noaw9KkHQO+LYHZCbImy0/Djcj7fujw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-A0N2qe0JOHubLxq-_Krbeg-1; Mon, 14 Mar 2022 12:52:31 -0400
X-MC-Unique: A0N2qe0JOHubLxq-_Krbeg-1
Received: by mail-ed1-f72.google.com with SMTP id l24-20020a056402231800b00410f19a3103so9118251eda.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 09:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UW4PA0HusSRlTEBiDBr9SYC11FMJgDOAGkeboPMyYyU=;
        b=SxXz4RZyZB3pf4v4OXmIFf/X0OaVRdRN0+yX8H2jaI/nohoNaAo49E0SG+m5IevG9O
         RlV6shzB5Nn4li2/xcAowm9dcZibIryJtdnKOvso/6zDuSoHgQIIkTvXy2qaTSBflgnh
         2tZ0U6YZLncPggWpucvaL/fBZtPGdThjeszN61M2oEW+t5NKVplpl6NmPzwhAkx8xtZ3
         GJrNOPxuS//tpk+NOQTut/I6VKDlHi3cu3vy0DzfzA8OFQ7edWrREOXJIQvGO3yYN06f
         VSn22WY8s7/QEdLIG3LhsrZerPG7Op2CH9MqeCuCNGLXT6crFlRlns77xEVtdKKGixxV
         YmjA==
X-Gm-Message-State: AOAM531VFouNZpdJkZ3SiK5Mw4GIshdwEXLq/BR64UHxsJPvW9X/Cj+a
        XKRpOVKjavrW3xqwDSb0cm/QJKCMfHJMAdfOvvvcct2CzPRKwIHsbSRIBt9C0hyhWrTRtjqatHC
        1tAeuuo8QwCuvbFsCudiIGCZiSMwAepYJNw==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id x17-20020a170906299100b006cf6b24e92fmr19215788eje.748.1647276749730;
        Mon, 14 Mar 2022 09:52:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyOpC8yysiJVH51l9L/mXMwtlyu7EGjhuCG+uo+INLqaQ8DnZfCWdUift74RtnItnATS82qA==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id x17-20020a170906299100b006cf6b24e92fmr19215768eje.748.1647276749387;
        Mon, 14 Mar 2022 09:52:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm7025681ejj.142.2022.03.14.09.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 09:52:28 -0700 (PDT)
Message-ID: <a53719db-f367-5033-c726-8fde794c7c4f@redhat.com>
Date:   Mon, 14 Mar 2022 17:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [PATCH 2/2] platform/x86: think-lmi: Certificate
 authentication support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220312000439.4143-1-markpearson@lenovo.com>
 <20220312000439.4143-2-markpearson@lenovo.com>
 <7f8a13f6-8615-b952-5523-e13bbc4b98be@redhat.com>
 <615cf1a0-e62f-2758-e4a4-f2ee7bae2886@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <615cf1a0-e62f-2758-e4a4-f2ee7bae2886@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/14/22 16:46, Mark Pearson wrote:
> Thanks for the review Hans
> 
> On 2022-03-14 11:15, Hans de Goede wrote:
>> Hi,
>>
>> On 3/12/22 01:04, Mark Pearson wrote:
>>> Implementation of certificate authentication feature for Lenovo
>>> platforms. This allows for signed updates of BIOS settings.
>>>
>>> Functionality supported:
>>>  - Cert support available check. At initialisation check if BIOS
>>>    supports certification authentication and if a certificate is
>>>    installed. Enable the sysfs nodes appropriately
>>>  - certificate and signature authentication attributes to enable
>>>    a user to install, update and delete a certificate using signed
>>>    signatures
>>>  - certificate_thumbprint to confirm installed certificate details
>>>  - support to go from certificate to password based authentication
>>>  - set_signature and save_signature attributes needed for setting
>>>    BIOS attributes using certificate authentication
>>>
>>> Tested on X1 Carbon 10 with special trial BIOS. This feature is not
>>> generally available yet but will be released later this year.
>>>
>>> Note, I also cleaned up the formating of the GUIDs when I was adding
>>> the new defines. Hope that's OK to combine in this commit.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> ---
>>>  drivers/platform/x86/think-lmi.c | 560 ++++++++++++++++++++++++++-----
>>>  drivers/platform/x86/think-lmi.h |   7 +
>>>  2 files changed, 475 insertions(+), 92 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>>> index 0b73e16cccea..54ce71f97c37 100644
>>> --- a/drivers/platform/x86/think-lmi.c
>>> +++ b/drivers/platform/x86/think-lmi.c
>>> @@ -16,6 +16,7 @@
> 
> <snip>
>>>  
>>> +static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
>>> +{
>>> +	const struct acpi_buffer input = { strlen(arg), (char *)arg };
>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>> +	const union acpi_object *obj;
>>> +	acpi_status status;
>>> +
>>> +	output.length = ACPI_ALLOCATE_BUFFER;
>>> +	output.pointer = NULL;
>>
>> This initialization of output is redundant, it is already initialized
>> when it is declared.
> Ack
> 
> <snip>
>>> +
>>> +static ssize_t certificate_store(struct kobject *kobj,
>>> +				  struct kobj_attribute *attr,
>>> +				  const char *buf, size_t count)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>>> +	char *auth_str, *new_cert, *p;
>>> +	int ret;
>>> +
>>> +	if (!capable(CAP_SYS_ADMIN))
>>> +		return -EPERM;
>>> +
>>> +	if (!tlmi_priv.certificate_support)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	new_cert = kstrdup(buf, GFP_KERNEL);
>>> +	if (!new_cert)
>>> +		return -ENOMEM;
>>> +	/* Strip out CR if one is present */
>>> +	p = strchrnul(new_cert, '\n');
>>> +	*p = '\0';
>>> +
>>> +	/* If empty then clear installed certificate */
>>> +	if (new_cert[0] == '\0') { /* Clear installed certificate */
>>
>> You don't need new_cert anymore here, so do:
>>
>> 		kfree(new_cert);
>>
>> here.
>>
>>> +		/* Check that signature is set */
>>> +		if (!setting->signature || !setting->signature[0]) {
>>> +			kfree(new_cert);
>>
>> and drop it here,
>>
>>> +			return -EACCES;
>>> +		}
>>> +		/* Format: 'serial#, signature' */
>>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>>> +				dmi_get_system_info(DMI_PRODUCT_SERIAL),
>>> +				setting->signature);
>>> +		if (!auth_str) {
>>> +			kfree(new_cert);
>>
>> and here.
>>
>>> +			return -ENOMEM;
>>> +		}
>>> +		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
>>> +		kfree(auth_str);
>>
>> Because you were missing a kfree(new_cert) here. Also you should free + clear
>> setting->certificate here. So this if block should end up like this:
>>
>> 	/* If empty then clear installed certificate */
>> 	if (new_cert[0] == '\0') { /* Clear installed certificate */
>> 		kfree(new_cert);
>>
>> 		/* Check that signature is set */
>> 		if (!setting->signature || !setting->signature[0])
>> 			return -EACCES;
>>
>> 		/* Format: 'serial#, signature' */
>> 		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>> 				dmi_get_system_info(DMI_PRODUCT_SERIAL),
>> 				setting->signature);
>> 		if (!auth_str)
>> 			return -ENOMEM;
>>
>> 		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
>> 		kfree(auth_str);
>> 		if (ret)
>> 			return ret;
>>
>> 		kfree(setting->certificate);
>> 		setting->certificate = NULL;
>> 		return count;
>> 	}
>>
>>
> Agreed - that all makes sense. Will update.
> 
>>> +	}
>>> +
>>> +	if (setting->cert_installed) {
>>> +		/* Certificate is installed so this is an update */
>>> +		if (!setting->signature || !setting->signature[0]) {
>>> +			kfree(new_cert);
>>> +			return -EACCES;
>>> +		}
>>> +		/* Format: 'Certificate,Signature' */
>>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>>> +				new_cert, setting->signature);> +		if (!auth_str) {
>>> +			kfree(new_cert);
>>> +			return -ENOMEM;
>>> +		}
>>> +		ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
>>> +		kfree(auth_str);
>>> +	} else {
>>> +		/* This is a fresh install */
>>> +		if (!setting->valid || !setting->password[0]) {
>>> +			kfree(new_cert);
>>> +			return -EACCES;
>>> +		}
>>> +		/* Format: 'Certificate,Admin-password' */
>>> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
>>> +				new_cert, setting->password);
>>> +		if (!auth_str) {
>>> +			kfree(new_cert);
>>> +			return -ENOMEM;
>>> +		}
>>> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_CERT_GUID, auth_str);
>>> +		kfree(auth_str);
>>> +	}
>>> +
>>> +	/* If successful update stored certificate */
>>> +	if (!ret) {
>>> +		kfree(setting->certificate);
>>> +		setting->certificate = new_cert;
>>> +	} else
>>> +		kfree(new_cert);
>>> +
>>> +	return ret ?: count;
>>
>> You have 2 "if (ret)" statements here (1 hidden in the return), please change this to:
>>
>> 	if (ret) {
>> 		kfree(new_cert);
>> 		return ret;
>> 	}
>>
>> 	kfree(setting->certificate);
>> 	setting->certificate = new_cert;
>> 	return count;
>>
> Will do
> 
>>
>>> +}
>>> +
>>> +static ssize_t certificate_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +			 char *buf)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>>> +
>>
>> setting->certificate may be NULL here, you need to check for that and in
>> that case only emit a "\n" I guess.
> Ack.
> 
>>
>>> +	return sysfs_emit(buf, "%s\n", setting->certificate);
>>> +}
>>> +
>>> +static struct kobj_attribute auth_certificate = __ATTR_RW(certificate);
>>> +
>>> +static ssize_t signature_store(struct kobject *kobj,
>>> +				  struct kobj_attribute *attr,
>>> +				  const char *buf, size_t count)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>>> +	char *new_signature, *p;
>>> +	int ret;
>>> +
>>> +	if (!capable(CAP_SYS_ADMIN))
>>> +		return -EPERM;
>>> +
>>> +	if (!tlmi_priv.certificate_support)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	new_signature = kstrdup(buf, GFP_KERNEL);
>>> +	if (!new_signature)
>>> +		return -ENOMEM;
>>> +
>>> +	/* Strip out CR if one is present */
>>> +	p = strchrnul(new_signature, '\n');
>>> +	*p = '\0';
>>
>> Idea for a follow-up clean-up patch: this pattern of kstrdup user-argument
>> (buf) + strip '\n' is repeated all over the driver, maybe add a little helper
>> for this?
>>
> Yes - that would make sense. Will do.
> 
>>> +
>>> +	/* Free any previous signature */
>>> +	kfree(setting->signature);
>>> +	setting->signature = new_signature;
>>> +
>>> +	return ret ?: count;
>>> +}
>>> +
>>> +static ssize_t signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +			 char *buf)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>>> +
>>
>> setting->signature can be NULL here.
> 
> Ack
> 
> <snip>
> 
>>> +
>>> +static ssize_t set_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +			 char *buf)
>>> +{
>>> +	return sysfs_emit(buf, "%s\n", tlmi_priv.set_signature);
>>> +}
>>> +
>>> +static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +			 char *buf)
>>> +{
>>> +	return sysfs_emit(buf, "%s\n", tlmi_priv.save_signature);
>>> +}
>>> +
>>> +static struct kobj_attribute attr_set_signature = __ATTR_RW(set_signature);
>>> +static struct kobj_attribute attr_save_signature = __ATTR_RW(save_signature);
>>
>> <note I missed this while reviewing the documentation patch...>
>>
>> Why not just use the /sys/class/firmware-attributes/thinklmi/authentication/Admin/signature
>> value here ?
>>
>> /sys/class/firmware-attributes/thinklmi/authentication/Admin/current_password is
>> what is used for password based setting of fw-attributes as well as for changing
>> the password; and
>>
>> /sys/class/firmware-attributes/thinklmi/authentication/Admin/signature is set
>> for changing the certificate, so it would be much more consitent to also use
>> that for setting attributes when using certificate based auth?
>>
>> Can / will the set and save signature ever be different from one another ? If yes
>> then I guess we may need 2 attributes for this, I guess maybe just signature +
>> save_signature ? Either way IMHO these 2 attributes / the 1 extra attribute
>> for a separate save-signature really belongs under
>> /sys/class/firmware-attributes/thinklmi/authentication/Admin/ IMHO and
>> not under /sys/class/firmware-attributes/thinklmi/attributes/
>>
>> What do you think about moving these there ?
>>
> I have no issues with moving them. I had originally intended to have
> them in auth but as I needed two signatures (the set and save are
> different) I decided to make it explicit and to keep them in the same
> place as the attribute being modified. But I can see it making sense to
> just keep those under Authentication instead.
> 
> I'll update and get rid of set_signature and move save_signature.

Sounds good, thank you.

> Many thanks for the review

You're welcome.

Regards,

Hans

