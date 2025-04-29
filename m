Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1521ABC2
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933230; cv=none; b=hthWb/294k1Dy5GrT+DvZQF07cNSUxraxfFv+t1iv9aLvpmJ76lT8EBJl2dfKszYBENfDgBOwWF9Ai1usx6RRvGkpvRK0RQfqjFnB5zy+gyCeeR3+6Odb7dYQQqMetHnhhZcEw0bosRldGXTPgKwx5+eKm8oP51Jh553aJrfpGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933230; c=relaxed/simple;
	bh=A4XD87qqt1s+PSnA4mrOVxeek4aOhNOKsuXjxllV2KY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mBY0aGtiT0ILCBAbWVMS12++2x67yKb72Uon0AbvE+t+E+sNSfp5lytPDI44RZk+m5h8mgR2/sRvppIJzAwzW9IL5idqLcPWKo1HIuC9qlQAVh527MMA7m99vZJ7IKT+pDjInvBFCeVJDy2yitHehUhNj5i6vloBNOTDHmI1FKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPErvh4t; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPErvh4t"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b98acaadso5688284b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933228; x=1746538028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PK3ZA6c1hSpEgTODEEYzFX0k9QeCfxYBZZ/WZQ/BZ+M=;
        b=mPErvh4tj/oFR9GcH339k1rjO9N6nAuWzybJNVJj49AwdwNWb/+xqA6LBMdLhavell
         PohPvR8iVfv0C/UC8vEJBWF/bPrww7QBtquzz9RfAgq4JOQVp6VkA+6urswPA56yfwNv
         WzuA7xvPDjGIkmCgJVOz3I8bxjxMMZmetJCF+q8dvFCgXDWv4GHo2JJcucaC1pn0QdeP
         8KKPTI/GdlkjGs8GcGqtRNGoGb480HMVbNjA/w/HSqihaVPK4VpbPNAnhmrgatWAh0gd
         6RG2zKSLD9nA1YEdcvL1qMIBB/xClfMex9ncn1vfmtsMqTH7XLC3dSDcV8AYBv1/rHr3
         zOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933228; x=1746538028;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK3ZA6c1hSpEgTODEEYzFX0k9QeCfxYBZZ/WZQ/BZ+M=;
        b=A70i153WiMxEu5HbA1naQkFmHyoecZd/0mxIeqtvqRxPtHxJuKi6AUESetzPFvvSzL
         4p/g7/Xh/2mjec0CDAKwsi6TYXldwYPHBz3m8AkoQDv9HRAvePOVzRXf28GvzMQdSaM0
         i6EG2s3zQEqJQkPKy4QnqqqPPz172j2D2R2Wcbj2ZneZfgTxXavoMZjdIMWJnTwnmfKB
         coGU5TDKV1kSwuuDNQh4QB1+XGXV4AZUlfjr88G+XDn2XLLQ7AlpYecdYkwsaOQBGXmo
         RIyxJT7uVAwyuJVHqXSlhIWtBdtDarwkC7881RgejvIvCPL/2Q8iXn2iBlghElGSVkEx
         blLw==
X-Gm-Message-State: AOJu0Yz7ToEL0eNkdl/Oonmi41pNZt187mWz8tqgk58WrZI5CUYSSvjd
	OpxfDZB+5zmtb9HGxVZ/wKeEkNVXhW3xEjh0z5F5w/oGevcQsgbb
X-Gm-Gg: ASbGnct8km1Kif7pVAwoHXCUeqlJd6z6lZhmb1jcKdO09gtyrGe897y5JPjq0EC0MiP
	NRMVUQNB4BjYk7M5zzPEfYCsVki+/vyMyLq8eC40OvoF6r+UyCJvVtNahxRX7xcH7xSS6p3SPTB
	P1QG5gdKxJ+Ug7LoWBd8QsaJbkSKO45oZtfq4s4+uNkJiD5plWXZomnHUE6diJFoi4L5gUuQkK9
	SG3u4aCRtMSwiSvFuS5PW+mnEft05qVSSDPqDem18ch59OWYHT4bnGn43dmWLEulO8eQpUYi0et
	n3dnFa9SLEuZrTxEBgQwrWThzZ9wEpJQgN3RtawFrkrcF/ZoonI/86ZLPt9pD/PxScmtJKOsjR6
	1YW+f20I=
X-Google-Smtp-Source: AGHT+IGdpULXW0cdGa3Vfmt9ZXSyT/KatEMJQ8noXZH/YJJI61B1npweolK6fQD7uega0j+GDLpqGQ==
X-Received: by 2002:a05:6a00:3990:b0:736:a7ec:a366 with SMTP id d2e1a72fcca58-7402942b04bmr3738924b3a.9.1745933227868;
        Tue, 29 Apr 2025 06:27:07 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9d308sm10183198b3a.147.2025.04.29.06.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:27:07 -0700 (PDT)
Message-ID: <a89e5fbf-6d03-4b00-a693-cb9e12e7942b@gmail.com>
Date: Tue, 29 Apr 2025 22:24:49 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
From: Nitin Joshi <nitjoshi@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423133912.16334-1-nitjoshi@gmail.com>
 <045d37f5-259c-4553-8257-51ab6fc43534@redhat.com>
 <63008847-719e-4a60-b33c-5a7d53068a1c@gmail.com>
Content-Language: en-US
In-Reply-To: <63008847-719e-4a60-b33c-5a7d53068a1c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Hans, Ilpo,

On 4/24/25 17:12, Nitin Joshi wrote:
> Hello Hans,
> 
> On 4/23/25 22:47, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Apr-25 3:39 PM, Nitin Joshi wrote:
>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>> send a new 0x131b hkey event when F9 key is pressed.
>>>
>>> This commit adds support for new hkey 0x131b.
>>>
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>> ---
>>> Changes in v3:
>>> * Avoid wasteful get_camera_shutter() calls and Minor changes based 
>>> on review comments to make
>>>    code more readable.
>>> Changes in v2:
>>> * Added ASL method to get camera shutter status and send it to 
>>> userspace.
>>> ---
>>>   drivers/platform/x86/thinkpad_acpi.c | 46 +++++++++++++++++++++++++++-
>>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/ 
>>> x86/thinkpad_acpi.c
>>> index 5790095c175e..0b011dcfc626 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>                              * directly in the sparse-keymap.
>>>                              */
>>>       TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera 
>>> Shutter */
>>>       TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint 
>>> doubletap on/off */
>>>       TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform 
>>> profile in 2024 systems */
>>>       TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform 
>>> profile in 2025 + systems */
>>> @@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
>>>       }
>>>   }
>>> +#define GCES_METHOD_ERR BIT(31)
>>
>> Does this bit really indicate an error ? From other vendors
>> this often is a device-not-present bit and the bit being set
>> would mean in this case that there is no camera-shutter on
>> the laptop we're running on.
>>
>> This also matches with the -ENODEV return.
>>
>> If this indeed is a device-not-present bit then this define
>> should be renamed to match that.
>>
> This BIT being set would mean there is no camera shutter.
> So, shall i change name to "#define DEVICE_NOT_PRESENT BIT(31)"
> OR
> I can just replace "METHOD_ERR" with "DEVICE_NOT_PRESENT" in below enum 
> and replace all METHOD_ERR in this file to "DEVICE_NOT_PRESENT":
> enum {
>      /* Error condition bit */
>      METHOD_ERR = BIT(31),
> };
> 
> I may have missed something but I think for consistency, its better to 
> rename METHOD_ERR. if its OK, i can modify like this in another patch 
> for this change.
> 

Sorry to bother you !
Please let me know your comments regarding any modification needed for 
this patch?
Thank you !

Thanks & Regards,
Nitin Joshi

>>
>>> +static int get_camera_shutter(void)
>>> +{
>>> +    acpi_handle gces_handle;
>>> +    int output;
>>> +
>>> +    if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", 
>>> &gces_handle)))
>>> +        return -ENODEV;
>>> +
>>> +    if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
>>> +        return -EIO;
>>> +
>>> +    if (output & GCES_METHOD_ERR)
>>> +        return -ENODEV;
>>> +
>>> +    return output;
>>> +}
>>> +
>>>   static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>>>   {
>>>       bool known_ev;
>>> @@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] 
>>> __initconst = {
>>>        * after switching to sparse keymap support. The mappings above 
>>> use translated
>>>        * scancodes to preserve uAPI compatibility, see 
>>> tpacpi_input_send_key().
>>>        */
>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, 
>>> { KEY_CAMERA_ACCESS_TOGGLE } },
>>>       { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, 
>>> similar to old ThinkPad key */
>>>       { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>       { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, 
>>> { KEY_PROG4 } },
>>> @@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct 
>>> ibm_init_struct *iibm)
>>>       const struct key_entry *keymap;
>>>       bool radiosw_state  = false;
>>>       bool tabletsw_state = false;
>>> -    int hkeyv, res, status;
>>> +    int hkeyv, res, status, camera_shutter_state;
>>>       vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>>>               "initializing hotkey subdriver\n");
>>> @@ -3467,6 +3488,12 @@ static int __init hotkey_init(struct 
>>> ibm_init_struct *iibm)
>>>       if (res)
>>>           return res;
>>> +    camera_shutter_state = get_camera_shutter();
>>> +    if (camera_shutter_state >= 0) {
>>> +        input_set_capability(tpacpi_inputdev, EV_SW, 
>>> SW_CAMERA_LENS_COVER);
>>> +        input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, 
>>> camera_shutter_state);
>>> +    }
>>> +
>>>       if (tp_features.hotkey_wlsw) {
>>>           input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>>>           input_report_switch(tpacpi_inputdev,
>>> @@ -3633,6 +3660,8 @@ static void 
>>> adaptive_keyboard_s_quickview_row(void)
>>>   /* 0x1000-0x1FFF: key presses */
>>>   static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>>>   {
>>> +    int camera_shutter_state;
>>> +
>>>       /* Never send ACPI netlink events for original hotkeys (hkey: 
>>> 0x1001 - 0x1020) */
>>>       if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= 
>>> TP_HKEY_EV_ORIG_KEY_END) {
>>>           *send_acpi_ev = false;
>>> @@ -3643,6 +3672,21 @@ static bool hotkey_notify_hotkey(const u32 
>>> hkey, bool *send_acpi_ev)
>>>               return true;
>>>       }
>>> +    if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
>>> +        camera_shutter_state = get_camera_shutter();
>>> +        if (camera_shutter_state < 0) {
>>> +            pr_err("Error retrieving camera shutter state after 
>>> shutter event\n");
>>> +            return true;
>>> +        }
>>> +        mutex_lock(&tpacpi_inputdev_send_mutex);
>>> +
>>> +        input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, 
>>> camera_shutter_state);
>>> +        input_sync(tpacpi_inputdev);
>>> +
>>> +        mutex_unlock(&tpacpi_inputdev_send_mutex);
>>> +        return true;
>>> +    }
>>> +
>>>       return tpacpi_input_send_key(hkey, send_acpi_ev);
>>>   }
>>
>> Otherwise this looks good to me now.
>>
>> Regards,
>>
>> Hans
> Thanks & Regards,
> Nitin Joshi
>>
>>
> 

