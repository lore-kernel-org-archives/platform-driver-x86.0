Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA81A0731
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757367; cv=none; b=PX4cWdU2WoXtrFeb47bpotCHjypEf/mM5Y8AaGdU5oQy/GECSXbWNWjNknshYNN5z2cpqX0AcDd+FTvB8l6QAvnTi2g7IbHwyRTy15gTgbj+7R/CL9hWXKD4NNA2nMTCV0GcjU0DA8bmjpIi6G5T+dYxxR1jnXnjPMqV3ozUk28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757367; c=relaxed/simple;
	bh=ljLqqTDrx5JZ5DFQ4u70Iqc20JmI64TSDW7cDQGpytQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AAvjO7Z5fQ/BjBZIM7TFCvL9UcDLdDHEpyU59o27cYRP9+ONaju/pekUaRY9/IpLBKXlOcjMjLTf+V69nSBbeXKU23gQgJ3XeRrv1yyU9DHBJBy+PEzDLh5rAr+Ma/NlO23nAQtWFA3pXTxoGejqVH0oykIGrK6HDcfXjAL0hEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+1LSiW7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+1LSiW7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227914acd20so28294825ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Apr 2025 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757364; x=1744362164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+BnX5AVUFFQBwWYbKHCQHlQeMsXu9NED8IpZHTTFleU=;
        b=M+1LSiW7g8sJWxH1p55GPnzB/jjfDUFkaS8lZWrBYth3qp+ODe+24EEpQGl1e5VHO9
         IIoCOJd3h0XfAgVooXIA608FyXHvF8m7kOFaf7kKw3WEtV+tPmamkFEFtOeSHnVoCidQ
         fF6LAWXvCSizdyqOEKkoB5HuzEoE2kallnAC5sfc92pC3VN/7VcVDhQmDK7cHSn90iyc
         XhoE95S6dMw9p59ZoA7SsCCNX7u3bgEsRdS6e9DVu8BVCcHtj+Yma99fpWJk0gJnzn18
         RocLkHpTkZIdaN52mNRe0XYCNwWkH9xeTs2iXQ/xW5byydnEr4UccqNBAWNZq4Bt5lmf
         DqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757364; x=1744362164;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BnX5AVUFFQBwWYbKHCQHlQeMsXu9NED8IpZHTTFleU=;
        b=Lh6hWZDeQmiyDT88l3LfXbcNzqfh1et1vpKCFgP1Y7TDJoz7EwYsxqHQ8TstprB17J
         H+7ktfKKaUI7AumMWfvImm8gQApSN4JZA6DvJDw+eGTaT5hOtHcjDcCnjK0NcGjNkTgy
         XLF3dA7h5fnR5SolJfgWchLcLgl7n/SWouRRq5IU+yuBoRs3FFmno3I7yH5W9SfCqrEJ
         qIa42NALmelZtidmwI2Sl9sQkhSGlkKQF1Uf77SbyW84W9rAScDmgNOcDsoyoX7OZFXA
         19IdNtvwZbkpZukXDFDZv29I6euA6uSnJJpBKhhPVEvbc1UN/e2Aoo1B65w6TDNQuiLk
         H2Qg==
X-Gm-Message-State: AOJu0YxpXn0zYz5gZ26PKi9wZQ6Ku9KOyBxGgpN2PW123VCbEAes7BAD
	MCCMkM6uola3NGmQMTeZEBRzMSfGZXLVjyd81FOoazPO60bnyavD
X-Gm-Gg: ASbGncujF+VV0DbfesMfo75NtHpDOCwvXXufWSpkzFNGfGELk1pfsJjS5DO4KDTMvAy
	AXort4UidrYQtHwUBzjYMS1K10c9w7TSynOWaYZAoWRq1O6gYbg7NawGZH8sugvXfhFa3LiOpTt
	SLKa1mUZQ0Fsr4m7fz9DwL2+/ZqALey7wZWthHZMLZaOF+KvcyLhAdtH6iIyAgHxDskYLH11gV+
	E5F2ahoUQx86G4xvRUPBYVUNcRbmavmqLg+Si/PrYvg4Qyz78UehXUkTb3GguDW0u4rn8D9n20I
	J17W4FeKsTbUrB75IhPhZJfgd3vMbix10qO8O1TGJAhUxRc4wDG0cn+LrLtJi4S3bWkr3ag5IdO
	Ac9FwfR4MgPJuYOQ/VZaxujQ=
X-Google-Smtp-Source: AGHT+IF9z3KugWPMzyRrYZR9tI0ViJyCg/Dmi4MEh/eRPgbbiBPF3W38yx0NLPBvyn3bOybBTLrz+g==
X-Received: by 2002:a17:903:1aa6:b0:221:1356:10c5 with SMTP id d9443c01a7336-229765bc866mr91138095ad.9.1743757364240;
        Fri, 04 Apr 2025 02:02:44 -0700 (PDT)
Received: from [10.131.178.61] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b41dfsm2909196b3a.136.2025.04.04.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 02:02:43 -0700 (PDT)
Message-ID: <0b0f51ab-667e-4497-8f24-2b9433427d1c@gmail.com>
Date: Fri, 4 Apr 2025 18:02:39 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nitin Joshi <nitjoshi@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 mpearson-lenovo@squebb.ca
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
 <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
 <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
Content-Language: en-US
In-Reply-To: <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Hans,

On 4/4/25 16:25, Hans de Goede wrote:
> Hi Nitin,
> 
> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>> Hello Hans,
>>
>> Thank you for reviewing patch.
>>
>> On 4/3/25 19:34, Hans de Goede wrote:
>>> Hi Nitin,
>>>
>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>
>>>> This commit adds support for new hkey 0x131b.
>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>
>>> Does the EC also actually enable/disable the camera in response to
>>> this new hotkey, or is this purely a request to userspace / the OS
>>> to enable/disable the camera
>> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
>> ?
> 
> Ok, I assume we can also get the state (enabled vs disabled)
> e.g. from the event? In that case the events should be reported using
> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
> state and set the switch to the initial state before registering
> the input device.
Enable/Disable status will be determine in IPU side which receives 
notification from EC. So, the only way to determine the status would be 
to determine the status in IPU side.
So, purpose of this patch will only to avoid "unhandled hkey event" 
error from thinkpad_acpi driver.
Please let me know, if i am missing something.

> 
> Regards,
> 
> Hans
> 
Thanks & Regards,
Nitin Joshi
> 
> 
> 
>>>> ---
>>>>    drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>> index 0384cf311878..80f77f9c7a58 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>                               * directly in the sparse-keymap.
>>>>                               */
>>>>        TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>>        TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>        TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>>        TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>>         * after switching to sparse keymap support. The mappings above use translated
>>>>         * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>>         */
>>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>>        { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>>        { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>>        { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>
>>
> 

