Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA32459CF
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032281; cv=none; b=h/zcG4V9qfwQFrFXvAjCrvCS0ZK367x/LJ26LilMa5SJVN+pwgtovODzBzpnw8WWles4rVbMJobCxc25GLukt0umoMiFnpacWnrbUdpxAqsMKhlzaDI3R10SMqNMTof2+rWosVZm0/q7y9JnQLVAJOuaum/OCURWDuWb8NAXPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032281; c=relaxed/simple;
	bh=XzZjhiXfpQeRJuraZUqVQzuYDaFJmF/I/sWScZWqTdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inv67Qly2VeylcLLE0jhstUqPOjfpFFmB2nITPCAxOlc9K31R5Qbfm2S/y5q5U3/d1jGvHidwfbEieraDUYvHUor9Ywwd0Vqv2V+fsjllUn94T7ThKf0NlxEVRLF4cRlf+1PfAvMuFaS/tHZJOyHbEJe+06LieQsZpA2SnhWkic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCgtjoPw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCgtjoPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpR5IP3ceQm23S+jJkguK/w2FLK0Q+5rUcmXH3zvLb0=;
	b=cCgtjoPwQwnrnAVkWOPwrw3TsjhtaaAZmc6cGnts1TBgAguhqTun90lHQl4ftcr+3yA8zT
	EjEsP5KsBRDcIz3mFnlcLc35V9tcAJ0mTaUNG5pS5xwa9pGsSd93YnwAf8l3pV5fYRn2Zt
	ZmJQpzieMaglkN0LriE0/ewWxa5lqes=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-kSWy2ug5NsWT3DU4k95jnA-1; Mon, 07 Apr 2025 09:24:36 -0400
X-MC-Unique: kSWy2ug5NsWT3DU4k95jnA-1
X-Mimecast-MFC-AGG-ID: kSWy2ug5NsWT3DU4k95jnA_1744032274
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so34003025e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Apr 2025 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032274; x=1744637074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpR5IP3ceQm23S+jJkguK/w2FLK0Q+5rUcmXH3zvLb0=;
        b=gdFXz71VxrhwGdS8UR6s0k0UwmzSA0cU6N8RDfA+zbZp4aMuCA5iQc0oZvHCRg8hXP
         kVpnD5DfJmBKdh9IxdkIlLx158KWnLYVphvfLw7c9Q7aSV+zXZ2nSasf+Pyp3meyhStE
         rKWGJnqGOCbZBsNo2jmaXBCaIAHzX5RI3gK10Ip/ee4lvw41wy15/xbU1EfZl78zJGac
         KlU/0xbv4iuZ2T1wceEFLv909c5WlQqR5j+pmbG5XXajBkNwmo5ucDPGRw//YSgHqO1d
         Z7uffIgiyiTgRyleQTyUN1REnO5TuKdlu0hiiSqzBRw+hohd4rNZhIb2wtvp3ITtHtb/
         QW2Q==
X-Gm-Message-State: AOJu0YxRi/YzBl1oNTSnXDDzYroNhkQmsNseutspLRTffGdy3hzCY/eC
	WH0pB3820NzwF7b9KlU0+Mf5LAectd0W8ajNohoMchfFYxa1tJYLRQ9QMse+0WxAZQI1b2MLIBH
	R+dWLM2wC7Ai6rnjeuKkuih8Um9B0JOa/tBJlL6+dFKvNR+NwVsgTzt+NOEY4s+dx8gdCAJI=
X-Gm-Gg: ASbGncv3UCZOKcSVlsjwvb7c+CwHJyhqEC4utCuEO0ZsP9BFnD7o7H2cXeQti9wMxFY
	4EAdh4xqke2zM8bMIx7k5fmOBAFUrftjMKLUSLcAZp5/9TG/MpfiHeH9gK13OsWJ2YtAJrXKq5A
	Kq1HDUqi9YjZFx7kiHIuiIZRRbTXqAgBCKGdHps1yVHRhKdwpnJFfJ4c+KZF7bPa7OZOuzhr9GV
	kZM/ItzE7X8o3yFKR5Oeony8kQk6I13elaJ2SaNbbkKPzhJEtEWogP4dkYAMW73FV/+106mmrfQ
	djyoyoeYrzuY5C2LyAM=
X-Received: by 2002:a05:600c:1e0f:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43ee0769282mr59967905e9.21.1744032274353;
        Mon, 07 Apr 2025 06:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSQueWUiJuKXQEqtLstyahcc3tPrRf+Tqf2y4kZcS/ArCR5BraphVoOvD8hrZTNkd6ytinyA==
X-Received: by 2002:a05:600c:1e0f:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43ee0769282mr59967775e9.21.1744032273997;
        Mon, 07 Apr 2025 06:24:33 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba3c4sm12302528f8f.59.2025.04.07.06.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:24:33 -0700 (PDT)
Message-ID: <c56025c9-da1a-428f-b5cf-4c3f0f9f51d6@redhat.com>
Date: Mon, 7 Apr 2025 15:24:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 Nitin Joshi1 <njoshi1@lenovo.com>
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
 <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
 <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
 <0b0f51ab-667e-4497-8f24-2b9433427d1c@gmail.com>
 <255bb094-ad3a-4711-866f-659b2687c929@app.fastmail.com>
 <f9256d26-6d74-4526-8ec8-3ea7edd01792@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f9256d26-6d74-4526-8ec8-3ea7edd01792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nitin,

On 7-Apr-25 05:27, Nitin Joshi wrote:
> Hello Mark,
> 
> On 4/5/25 04:23, Mark Pearson wrote:
>> Hi Nitin,
>>
>> On Fri, Apr 4, 2025, at 5:02 AM, Nitin Joshi wrote:
>>> Hello Hans,
>>>
>>> On 4/4/25 16:25, Hans de Goede wrote:
>>>> Hi Nitin,
>>>>
>>>> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>>>>> Hello Hans,
>>>>>
>>>>> Thank you for reviewing patch.
>>>>>
>>>>> On 4/3/25 19:34, Hans de Goede wrote:
>>>>>> Hi Nitin,
>>>>>>
>>>>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>>>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>>>>
>>>>>>> This commit adds support for new hkey 0x131b.
>>>>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>>>>
>>>>>> Does the EC also actually enable/disable the camera in response to
>>>>>> this new hotkey, or is this purely a request to userspace / the OS
>>>>>> to enable/disable the camera
>>>>> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
>>>>> ?
>>>>
>>>> Ok, I assume we can also get the state (enabled vs disabled)
>>>> e.g. from the event? In that case the events should be reported using
>>>> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
>>>> state and set the switch to the initial state before registering
>>>> the input device.
>>> Enable/Disable status will be determine in IPU side which receives
>>> notification from EC. So, the only way to determine the status would be
>>> to determine the status in IPU side.
>>> So, purpose of this patch will only to avoid "unhandled hkey event"
>>> error from thinkpad_acpi driver.
>>> Please let me know, if i am missing something.

We don't want to just avoid the "unhandled hkey event" message,
we also want to send an event to userspace that the camera has
been enabled or disabled, including information if it is
being enabled or being disabled. This way userspace can show an OSD
indicating that the camera has been enabled/disabled similar to how
we do this when e.g. the mic is muted.

This must be reported to userspace using SW_CAMERA_LENS_COVER, which is
what all kernel code which reports camera shutter state
(be it a true shutter or hw blacking out of the image) is using now.

Or maybe the IPU6 driver itself can report SW_CAMERA_LENS_COVER,
assuming the IPU6 driver also receives an event when the camera
shutter status changes ?

>> I hadn't thought about this - but we need to be able to track the status to make sure (eventually) that the right status gets displayed in userspace. It would be bad if it was out of sync with the IPU.
>>
>> Is the initial status always going to be disabled, or do we need a mechanism from Intel to probe the current status?
> 
> I need to check regarding this but AFAIK, we don't have any other mechanism to probe current status. Also , there was some security concern involved in this which i need to clarify.

I don't see how userspace knowing if the shutter is in open/closed
state impacts security. Userspace still cannot control the shutter.

Regards,

Hans




>>>>>>> ---
>>>>>>>     drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>> index 0384cf311878..80f77f9c7a58 100644
>>>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>>>>                                * directly in the sparse-keymap.
>>>>>>>                                */
>>>>>>>         TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>>>>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>>>>>         TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>>>>         TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>>>>>         TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>>>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>>>>>          * after switching to sparse keymap support. The mappings above use translated
>>>>>>>          * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>>>>>          */
>>>>>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>>>>>         { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>>>>>         { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>>>>>         { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>>>>
>>>>>
>>>>
> 

