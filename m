Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76741C77B60
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 13:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240795AbjDZNOg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 09:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240710AbjDZNOf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 09:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A95D170D
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682514831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r5FMj5V6zQGEx1smSeHyO2VckisagRWE0U4SFvOEqxo=;
        b=J1ZRx6k7OkGeqtRlOqLmYyiMmQgZLuKgGelvMGvqrK6SRqWKX9zxTQwuju7N0z2b8i2Xv6
        1AEiZsDkqJJtoR8pYep3MfMcRpNwAby5tRecv7IDjVnw3ysNMJpHjtnDYsROwes8PYl8J/
        VMLKa5mzTIHP2RBikIdYYugyZc1r+/s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-ACraUDtWOom13KTgBdjA5Q-1; Wed, 26 Apr 2023 09:13:47 -0400
X-MC-Unique: ACraUDtWOom13KTgBdjA5Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-509e422cfb3so4016219a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 06:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682514826; x=1685106826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5FMj5V6zQGEx1smSeHyO2VckisagRWE0U4SFvOEqxo=;
        b=A55i0P1aJUkvom4Q2IYTd4yC0gquApLsYp615qIZ9ZB2KSo4X+fw5z0MrrPK4IFNfE
         ZjRghkvSB8oe6ZuEJlCgaj5ymtSCovMYD6/bolTnEhALFfeybtTjDn1PGE8sU2Ri7Yxn
         v1/D0C3Qg1EtTir+6//4es7+tbdBWlPx+kwwO7HnPf+LzKwK4T8YSQOEn+FckiL+u6Eq
         XLtdWWWwORpefOTjk/E6Tt0w+h92/WOsIWwRPjztCAV2Hehfos4bgl7jI+Efy+gzBwJp
         ditMZw3p+GyzelWyrcdxztP2YmkbxlDLhoWW40Z6clpeXcD21Hg6K5hA2ilggsm52oc2
         dGdw==
X-Gm-Message-State: AAQBX9fRrXjMMem1hzFpqsM7CeJNmFZHygjJ3Ho2J/0oAayGMHG3bbdn
        2sygvdUfTx8nExXF6DA9Uom33qkB0KcwoDnzD59s+rSNwlu8AvypiCC06y6EC0U7KnnIqhaAJpW
        J7+S3BDXHcPj/xwdMqMUwy5QGGH1K3vROXg==
X-Received: by 2002:a17:906:5a45:b0:94f:2852:1d2b with SMTP id my5-20020a1709065a4500b0094f28521d2bmr15549504ejc.72.1682514826460;
        Wed, 26 Apr 2023 06:13:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yav2rCQ6o4OfF1/qgcXthGVrMPHSf2rKrA/ZeHhE8xWzywFVnyOuguqMCQ54Fj8T+PyHIyGQ==
X-Received: by 2002:a17:906:5a45:b0:94f:2852:1d2b with SMTP id my5-20020a1709065a4500b0094f28521d2bmr15549483ejc.72.1682514826132;
        Wed, 26 Apr 2023 06:13:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709063bca00b0094ee3e4c934sm8220307ejf.221.2023.04.26.06.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 06:13:45 -0700 (PDT)
Message-ID: <8651f747-b932-4cbc-52ca-046f7b1d700e@redhat.com>
Date:   Wed, 26 Apr 2023 15:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 06/14] HP BIOSCFG driver - passwdobj-attributes
Content-Language: en-US, nl
To:     thomas@t-8ch.de, Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230420165454.9517-1-jorge.lopez2@hp.com>
 <20230420165454.9517-7-jorge.lopez2@hp.com>
 <016a9a6a-cff1-444d-b96a-63eded1ac58a@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <016a9a6a-cff1-444d-b96a-63eded1ac58a@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/23/23 11:07, thomas@t-8ch.de wrote:
> On 2023-04-20 11:54:46-0500, Jorge Lopez wrote:
>> ---
>>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 669 ++++++++++++++++++
>>  1 file changed, 669 insertions(+)
>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>>
>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>> new file mode 100644
>> index 000000000000..c03b3a71e9c4
>> --- /dev/null
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c

<snip>

>> +static ssize_t current_password_store(struct kobject *kobj,
>> +				      struct kobj_attribute *attr,
>> +				      const char *buf, size_t count)
>> +{
>> +	char *p, *buf_cp;
>> +	int id, ret = 0;
>> +
>> +	buf_cp = kstrdup(buf, GFP_KERNEL);
>> +	if (!buf_cp) {
>> +		ret = -ENOMEM;
>> +		goto exit_password;
>> +	}
>> +
>> +	p = memchr(buf_cp, '\n', count);
>> +
>> +	if (p != NULL)
>> +		*p = '\0';
> 
> This will also accept input like "foo\nbar" and truncate away the "bar".

That is true, but stripping '\n' at the end is a pretty standard
pattern for sysfs attr store functions since users will e.g.
often do:

echo one-string-out-of-a-few-valid-strings > /sys/.../some-enum-attr

Where to actually write the real valid string the user should do:

echo -n one-string-out-of-a-few-valid-strings > /sys/.../some-enum-attr

See e.g.:

drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c new_password_store()

which does the exact same thing.

The stripping of '\n' is often taken care of by various kernel
helpers for sysfs attr.

> For something like a password it seems errorprone to try to munge the
> value.

Almost all password input dialogs including the actual BIOS password
input dialog will consider the enter key / a new-line to mean
"end-of-password, please validate the password inputted so far"

So I don't think this is really a problem. With that said we
could make this more robust (and maybe also change the Dell
code to match) by doing:

	len = strlen(buf_cp);
	if (len && buf_cp[len - 1] == '\n')
		buf_cp[len - 1] = 0;

To ensure that we only ever strip a leading  '\n'
and not one in the middle of the buffer.

Regards,

Hans




