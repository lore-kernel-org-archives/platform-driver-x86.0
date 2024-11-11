Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0D12C54B
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318814; cv=none; b=fxR1yerRqqmNk/ZBHxxNYxjuqaNXNU/sqm5SWG16W4dBaaRqJRwdzjNALmLTmsiCmLMgx7Qs8j6lDw1VaJUHJTzydJI655QNvWPdX/+xL07lKpegnXVKf6DT8PX2ZaNx8OEq5F51EXYg8nCVKrzOSVOqfhbbP0VJXpF5Wa8uZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318814; c=relaxed/simple;
	bh=r5Y0TPaTWzeBWXTp9Capb71UxXRFVsy8sW8M6O6hTwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOgWolGxUWqBzMwvO+IZ2qf2e+JHvkaIEDhOVb5ja4jhRDhudVCDnx0zc4GWu29Pk20Na51enejYGhdGya/ZOtuvTDvVLpyRywWBvqH9mDY+EEnOMkZeQE3153yW6qkUUDn3qoibyNV7hydXXwiX/+YJ/iGoURxCou7zH56ppNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMDLF1w9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMDLF1w9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731318811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihDmHWQYRCjG5N/CO+km3biO5gS5YBsWUY/hiKLQxTs=;
	b=aMDLF1w92JPiFvFxXhtGwBCSL9XPd+wgx89iAsCBvRK3DPxyrFd6/LZ/+dytEc3v7FzRwW
	I+VGWWTl11sRnG0BE6QqVxIxEBEbQX8315TLCtZ0tMWjWcflkp2i9Fo91MwjniAgNHnhC0
	hVOaYIF+nQvWx9Sedfl00DTixRVfa1k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-V8FYnHTLPl6Mk4vlYrQd7Q-1; Mon, 11 Nov 2024 04:53:29 -0500
X-MC-Unique: V8FYnHTLPl6Mk4vlYrQd7Q-1
X-Mimecast-MFC-AGG-ID: V8FYnHTLPl6Mk4vlYrQd7Q
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2c3e75f0so333286966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 01:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318808; x=1731923608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihDmHWQYRCjG5N/CO+km3biO5gS5YBsWUY/hiKLQxTs=;
        b=dET4PE6T3KGHXrUXbrcO6vHYEi34OhH9CTu2A+lNWlUodsQ7nzVNUE/UwihrIr2qCk
         qi6/jMiXxGVZvkDbNb/GC+C8xQwzOkCbKgq9wr6tmURHCcclmAvkQEdpcP4D2SgdHAdm
         BSKFYouY/bT3obbcijMGc6jMffW9+DX09b84CdopxKUS/2sr8byS5qx+vzX1R36wpsSV
         095qCbVDe2Z1Z0g9g0lR4zC1y2blOczMyOAp8V4HU+7MD7KxPe/T7J8FLNAGotiHRLzl
         EovEKVkw2e1VrSR7H1X4O2b5/utH8gJlkmKNZw+HPJgvY4vuWnGgyWEBn8bisxINrUfk
         qaQw==
X-Forwarded-Encrypted: i=1; AJvYcCUbGDSWYs+I6WUSTdIQSbtdjgpp4yCBQdBvkPLwCRNJMMCAEygHRPLj3eCJJif5vMBDgUMrM5cOCh6+rXk5+sBiBT2G@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjWGm39jmC/o8yN+TnbCmRrJChL0IGHPZvm9KIiGbU2xwJTNs
	Z+oVt4JoEAp/9aNWXFi9IpCh/O8Mbhf3Soh8BfjuuSiPbW1U/cDEHrv8JDpVZ4cOovRD05B+Sn0
	q5z8yxPBD/SqsZCBy7ucDMkB3M+BEh7ZLNiIWN5sqPMV2FptAkjqb0xpHh3lLsnwoh2VhJB4GFC
	sXUx8=
X-Received: by 2002:a17:906:eecb:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-a9eefeb4d57mr1194680866b.5.1731318808138;
        Mon, 11 Nov 2024 01:53:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcy73/4/ru/ptEchF/zD2h2bk6PGSFYBut1PdWzPKC0HV1BRohL+wxdCgwkYTkbfnRsnM/1A==
X-Received: by 2002:a17:906:eecb:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-a9eefeb4d57mr1194679566b.5.1731318807682;
        Mon, 11 Nov 2024 01:53:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deeef7sm573105766b.145.2024.11.11.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:53:27 -0800 (PST)
Message-ID: <77092565-cf7e-47a5-8114-c5ab55137a8a@redhat.com>
Date: Mon, 11 Nov 2024 10:53:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Add support for
 getting serdev-controller by PCI parent
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241109220530.83394-1-hdegoede@redhat.com>
 <20241109220530.83394-5-hdegoede@redhat.com>
 <CAHp75Vcp1AxcZcAqoA9e-YXerHPaRAxsoGT34R41aQeaMUrgCg@mail.gmail.com>
 <b8340169-5832-4aa2-8713-9639b7f7aec4@redhat.com>
 <ZzHQVAVJvbiRohPh@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZzHQVAVJvbiRohPh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11-Nov-24 10:37 AM, Andy Shevchenko wrote:
> On Sun, Nov 10, 2024 at 11:27:31PM +0100, Hans de Goede wrote:
>> On 10-Nov-24 12:51 PM, Andy Shevchenko wrote:
>>> On Sun, Nov 10, 2024 at 12:05 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       if (dev_info->use_pci)
>>>> +               ctrl_dev = get_serdev_controller_by_pci_parent(info);
>>>> +       else
>>>> +               ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
>>>> +                                                info->ctrl_devname);
>>>
>>> I would expect that they both take info as an argument...
>>
>> The "old" get_serdev_controller() helper for getting the controller
>> by ACPI HID + UID is also used outside of the x86-android-tablets code
>> and struct x86_serdev_info is x86-android-tablets specific.
> 
> I see, thanks for elaborating this.
> 
>>>>         if (IS_ERR(ctrl_dev))
>>>>                 return PTR_ERR(ctrl_dev);
> 
> ...
> 
>>>>  struct x86_serdev_info {
>>>> +       /* For ACPI enumerated controllers */
>>>>         const char *ctrl_hid;
>>>>         const char *ctrl_uid;
>>>> +       /* For PCI enumerated controllers */
>>>> +       unsigned int ctrl_devfn;
>>>> +       /* Typically "serial0" */
>>>>         const char *ctrl_devname;
>>>
>>> Why not union as we have a type selector, i.e. use_pci ?
>>
>> A union would be possible. I simply did not think of that.
>>
>> Not sure if it is worth the trouble though, since it saves
>> only 8 bytes on a struct which is currently used only 3 
>> times in the driver.
> 
> Saving bytes is not the main point, the main point is to make the code robust
> against writing both fields and make things confusing. Along with that, union
> gives a reader the clue that those fields are never used at the same time. So,
> can you consider using union?

Ack, I will prepare a v2 using an union when I have some time to work on this.

Regards,

Hans


