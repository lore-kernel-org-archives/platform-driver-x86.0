Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF377C43461
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 08:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E4736135B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 08:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236650AbhEUIMZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 04:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230101AbhEUIMF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 04:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621584638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=51iGChx+/n00mlAPsjC8xAI9ymxcQsl2/DbjvxZuRXI=;
        b=RNxYtvyjvQ7uGoiTosg1dpBgyaVw8jqpUiegphHOQSYT/NBGSWGEPK2PFZvgUVgvK3hWLo
        I7XuSum8R50+tVHiBCagnpSC27LUBdoIDKoYT7sk54jTFo1fuu/mhdGrmHvADnVosBmlLj
        vIiAecxLqsDsIPUk0/gvYkn4caxfG/A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-c5af426kPuyIosOgfRGalQ-1; Fri, 21 May 2021 04:10:37 -0400
X-MC-Unique: c5af426kPuyIosOgfRGalQ-1
Received: by mail-ed1-f70.google.com with SMTP id s20-20020a0564025214b029038752a2d8f3so10926163edd.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 01:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=51iGChx+/n00mlAPsjC8xAI9ymxcQsl2/DbjvxZuRXI=;
        b=ipH4KRG47GD+Q7y3yjejQME27UGt5qIINojAuaQxqpRJjvSCx1ioEYwBLDqNtQ+wi+
         l/rsFciiMNWBJo+ANKDp0QTtkfJ0NnhO3d/AXsGMePwgTKjyNdGgHIoR1pchJLPxBsR5
         ctWWXWwI5IQQKBvO525ITLwS1vrMug4528UhQdWVaHBQcn8MpPsjtIquWk86o3B9/EX1
         /t96i3YmeqHydDyR52CO9t+HlNSyvKOumyiHc1uNHmKldk6YqQPpGUYP5FHpSu+/O8T8
         MBYa2TouJ1vdLte7Nlj+RIY1x3WNSRCmfpIkIEsH5lGn35XFe10LN0NSf5sPGIDPKP2j
         zIVg==
X-Gm-Message-State: AOAM530+CWVEEumh11i1R64ifQWDWF3K5kMdFS6wgtpVL06lqMJ51wlw
        yYNt6g0ZOasjDTFDlQJ+/VNwQqtR7Q25rkQIK+X1XT1X+KUj340nHV3xbZ6vF7+bzQ01qVz33dF
        XGNyA9cKFX2SOuqrYBQPh9B7wfw7bcvRZeg==
X-Received: by 2002:a17:906:b0cb:: with SMTP id bk11mr9279398ejb.310.1621584635774;
        Fri, 21 May 2021 01:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0u7UJEiKPis/w24mIbYDVOZLMwRbniA01Zl9+S7kMROO2BPPk0MbSUyb9SwmMx2uQFDXF+g==
X-Received: by 2002:a17:906:b0cb:: with SMTP id bk11mr9279381ejb.310.1621584635550;
        Fri, 21 May 2021 01:10:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d5sm3385793edt.49.2021.05.21.01.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 01:10:35 -0700 (PDT)
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        divya.bharathi@dell.com, prasanth.ksr@dell.com
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
Date:   Fri, 21 May 2021 10:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 5/20/21 7:18 PM, Mark Pearson wrote:
> Thanks for the review Hans,

You're welcome.

> On 2021-05-19 1:06 p.m., Hans de Goede wrote:
>> Hi,
>>
>> On 5/9/21 3:57 AM, Mark Pearson wrote:
> <snip>
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> index 8ea59fea4..31d1becfa 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>>> @@ -185,6 +185,17 @@ Description:
>>>  					A write only value that when used in tandem with
>>>  					current_password will reset a system or admin password.
>>>  
>>> +		encoding:
>>> +					For platforms that require it (currently Lenovo) the
>>> +					encoding method that is used. This can be either "ascii"
>>> +					or "scancode". Default is set to "ascii"
>>> +
>>> +		kbdlang:
>>> +					For platforms that require it (currently Lenovo only) the
>>> +					keyboard language method that is used. This is generally a
>>> +					two char code (e.g. "us", "fr", "gr") and may vary per platform.
>>> +					Default is set to "us"
>>> +
>>
>> I should have caught this during my review of v1, these are Lenovo specific, so please prefix
>> them with lenovo_ (the same is already done for dell specific sysfs attributes) and move them
>> to a separate "Lenovo specific class extensions" part of the doc.
>>
> No problem
> 
> <snip>
> 
>>>  
>>>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index b0e1e5f65..0511c54fc 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -639,6 +639,18 @@ config THINKPAD_ACPI_HOTKEY_POLL
>>>  	  If you are not sure, say Y here.  The driver enables polling only if
>>>  	  it is strictly necessary to do so.
>>>  
>>> +config THINKPAD_LMI
>>> +	tristate "Lenovo WMI-based systems management driver"
>>> +	default m
>>
>> default n (or no default at all) please.
> Ack
> 
> <snip>
>>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>>> new file mode 100644
>>> index 000000000..2fa989e98
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/think-lmi.c
>>> @@ -0,0 +1,890 @@
> <snip>
>>> +
>>> +/* ---- Authentication sysfs --------------------------------------------------------- */
>>> +static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +					  char *buf)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>>> +
>>> +	if (setting->valid)
>>> +		return sysfs_emit(buf, "1\n");
>>> +	else
>>> +		return sysfs_emit(buf, "0\n");
>>
>> Maybe use:
>>
>> 	sysfs_emit(buf, "%d\n", settings->valid);
>>
>> instead?
> Definitely :)
> 
>>
>>
>>> +}
>>> +
>>> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
>>> +
>>> +static ssize_t current_password_store(struct kobject *kobj,
>>> +				      struct kobj_attribute *attr,
>>> +				      const char *buf, size_t count)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>>> +	int length;
>>> +
>>> +	length = strlen(buf);
>>> +	if (buf[length-1] == '\n')
>>> +		length--;
>>> +
>>> +	if (length >= TLMI_PWD_MAXLEN)
>>> +		return -EINVAL;
>>> +
>>> +	memcpy(setting->password, buf, length);
>>> +	setting->password[length] = '\0';
>>> +	return count;
>>> +}
>>> +
>>> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
>>> +
>>> +static ssize_t new_password_store(struct kobject *kobj,
>>> +				  struct kobj_attribute *attr,
>>> +				  const char *buf, size_t count)
>>> +{
>>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>>> +	char *p, *new_pwd;
>>> +	char *auth_str;
>>> +	int ret = 0, len;
>>> +
>>> +	if (!capable(CAP_SYS_ADMIN))
>>> +		return -EPERM;
>>> +
>>> +	if (!tlmi_priv.can_set_bios_password)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	new_pwd = kstrdup(buf, GFP_KERNEL);
>>> +	if (!new_pwd)
>>> +		return -ENOMEM;
>>> +
>>> +	p = strchr(new_pwd, '\n');
>>> +	if (p)
>>> +		*p = '\0';
>>> +
>>> +	if (strlen(new_pwd) > setting->maxlen) {
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>>> +	len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
>>> +		+ strlen(setting->kbdlang) + 3 /* type */
>>> +		+ strlen(new_pwd) + 6 /* punctuation and terminator*/;
>>> +	auth_str = kzalloc(len, GFP_KERNEL);
>>> +	snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
>>> +		 setting->pwd_type, setting->password, new_pwd,
>>> +		 encoding_options[setting->encoding], setting->kbdlang);
>>> +	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
>>
>> So I guess on success any subsequent calls need to use the new password,
>> so the user is expected to write the new password to the current_password
>> file after changing the password this way?
>>
>> I just checked the dell-wmi-sysman code and that does this:
>>
>>         /* clear current_password here and use user input from wmi_priv.current_password */
>>         if (!ret)
>>                 memset(current_password, 0, MAX_BUFF);
>>
>> Where current_password points to either the user or admin cached password,
>> depending on which one is being changed.
>>
>> So that seems to work the same way as what you are doing here (the user needs to
>> write the new password to current_password after changing it through the
>> new_password sysfs attribute). Can you add a patch to the patch-set documenting
>> this in Documentation/ABI/testing/sysfs-class-firmware-attributes ?
>>
>> Also you may want to consider clearing out the old cached password on success
>> like the Dell code is doing.
>>
> Would you have any objections/concerns if, on a successful password
> update, this function just updates the stored password setting to the
> new password.
> Seems nicer from a user point of view then having to go and feed the
> current_password field again.
> e.g: strncpy(new_pwd, setting->password, TLMI_PWD_MAXLEN)

Please use strscpy, strncpy has horrible syntax and using it is easy
to get wrong.

e.g. the above example is wrong if strlen(new_pwd) >= TLMI_PWD_MAXLEN
the resulting setting->password will not be 0 terminated (and you
seem to have swapped src and dst, but that is unrelated to strncpy
being a sucky function).

This also make me realize that the code has 2 max-pwd-lengths:

setting->maxlen
TLMI_PWD_MAXLEN

I think you should put a:

	if (WARN_ON(pwdcfg.max_length > TLMI_PWD_MAXLEN))
		pwdcfg.max_length = TLMI_PWD_MAXLEN;

in tlmi_analyze() so that we get a kernel-backtrace (and thus bugreports
if this condition ever becomes true.

And then use pwdcfg.max_length everywhere (e.g. also for the check in
current_password_store()).

Also the length checks in current_password_store() and new_password_store() 
should probably also check against settings->minlen ?


> I know it would make Dell and Lenovo operate differently (I can add that
> detail to the documentation) but it just feels like a nicer design.

That works for me. Perhaps you can also do a (compile tested only) RFC
patch for the Dell code to do the same thing (replace the memset 0 with
the strscpy) to see if the Dell folks are ok with also doing things this
way ?

Regards,

Hans


