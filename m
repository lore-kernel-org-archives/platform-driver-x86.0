Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBC29CE8
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Apr 2025 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745283178; cv=none; b=GXnVaBoffUTjtPSIzXN3BVuOQ4i/FwEAZLVv5aOYiM6UpS1JT/f9DQT5De1Ps+J+8KB1GaEjLQ/fnCulgZCgE6QtBH9wMeTTIcZsYyxm4MOZ8ppvOnshnSFFvYEU4N37tTOLvkymk5bfjMRH2PavbjpOxbQ65ODCk1mwqweqgLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745283178; c=relaxed/simple;
	bh=Yo7aaZ/s3fYpK7MumPJyYCmlSE9frBLBWheEciJzLdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqNypD5O4KlF1T+Px8kyFgQojadATBRb2WHrDFh2nyuPh9ikaiYehMcOWK2Onf+B2XMjnorumYHSyKxmUBGPRs5+eFUMTd4ZWmEOcPmkzzLqQI8xuFwbkkLxoV+jO1eZgYLu4DkfxbmTADyB7wLzHJI7ulDq8L0Wckm3x51/8cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dalEnrLX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dalEnrLX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33677183so51729995ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745283176; x=1745887976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhA46i4NvncAy739SddsXsokTeQ1b36oumx1o4vAmkc=;
        b=dalEnrLXgk1urPqxFskrK7vlROIQkyGUHUH58q6iEXKGO76Qb3d0u3hVPtxE7KF7TR
         5mxB8gGFDOTM6amtflYQyPmBSAKNqIeldCzGbE8rzS2H1noJo+0Q+ic4Hj0CpLfw7EB2
         ZqMqkfRMxLSOmpRmaobYZZcT0IG2KNT4RclzJ1Istpa92cuEVtpQ3dSmpdUWh17EasZR
         vwEJfrD4aptADYgtOun17/7PyTGrs4exZ+iRgnjRWfHCoyrwBcM42tbMOCKxTl2Uddl0
         ISWa1hIU4E9V3mNlkXP+gn9ldNSu71tIwuoGCkTs30qPTQkgQn2raWFo+yuNUCPhGDNR
         y6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745283176; x=1745887976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhA46i4NvncAy739SddsXsokTeQ1b36oumx1o4vAmkc=;
        b=S6ESohKLb7K6rbXm8sX69N1d6UHQ6ujAPpL3ovgQXwSeHQ8Zmq5ECYPrA7SmcYdzKe
         MTLjd7LbPK3V0sST3tDGBmLpbjB2bYUsyrb8SKMjuQRLO6JWQ7wYAYY+EeXN6viwR+GW
         B1kZf9iv0bytI8xIDkJvWCHQY7IjJeGCPQFzkGwf8TKeTOD+eijY7yQEvfzheDIeITIr
         jdkA1VUGWzuezjCcfVpYeCfy+VXhgAxz/V+71NvTu+LKxoYoOZI02byfvkdF7zuJEAe+
         XkNB7i0uqgFlDhvU8XYfoChN+YCoiB1fJ1jfDRb6ijnb8nmBCib3N1NFEr3zj3WjwFrB
         zgLg==
X-Gm-Message-State: AOJu0YwX8GjknrIEAsVrRwwMI1VNaZ8p0UMb6LTF62G7vI1sYIySS0y9
	DGbvIToevJeptXRMD6I711oJtvG8TIkiOyZ0KY+lwPFctlipdxUC
X-Gm-Gg: ASbGncs0jWK2GHfn9f8ar90CTqYr72ylpSHlSIvdSTsrBsJSZ83oth9klAJDfHq/4mK
	+6Jy4P2yQrXND+QiovE29hA/q+xaZyL9W13ThczO0tjd6P12JaLV+jkwI2TlS+/8sFAIw6hPUTK
	GSRv8kAv5uEs20VdQBPEEQp+P+P+HdlxrXEKCgDsg6c0p0pC6bhyq3jsLotwG4HEsFVcrWeO7BR
	HDCfhaLubHaFbPWPh/MrUs5rxZLjx0eJCcarknO4eFzyeEJOqApOw8mPBBBwhuBGTdWrK3xtmMh
	Rcjn23ZJq07GpczrHHl+PmE5z4fZSYIs7xJvdutOjhGpVu1x7bwQiLy2/d+ZSpXfLIgtD16N38b
	vNPqf4ir9yjn5rjUq6g==
X-Google-Smtp-Source: AGHT+IEijrG0Uw/FAmk4RfCD0IIxcV2jcncL168EGdAHuLmPLYcLjMP9SHYcLVwF2BEbzr+XAfX5lg==
X-Received: by 2002:a17:902:db03:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c5360dc1emr170449355ad.37.1745283175740;
        Mon, 21 Apr 2025 17:52:55 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0feb14sm8305610a91.35.2025.04.21.17.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:52:55 -0700 (PDT)
Message-ID: <efc8ad1f-9fe9-4ba1-9013-e9f758da3ffc@gmail.com>
Date: Tue, 22 Apr 2025 09:50:39 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
 <c56025c9-da1a-428f-b5cf-4c3f0f9f51d6@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <c56025c9-da1a-428f-b5cf-4c3f0f9f51d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Hans,

On 4/7/25 22:24, Hans de Goede wrote:
> Hi Nitin,
> 
> On 7-Apr-25 05:27, Nitin Joshi wrote:
>> Hello Mark,
>>
>> On 4/5/25 04:23, Mark Pearson wrote:
>>> Hi Nitin,
>>>
>>> On Fri, Apr 4, 2025, at 5:02 AM, Nitin Joshi wrote:
>>>> Hello Hans,
>>>>
>>>> On 4/4/25 16:25, Hans de Goede wrote:
>>>>> Hi Nitin,
>>>>>
>>>>> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>>>>>> Hello Hans,
>>>>>>
>>>>>> Thank you for reviewing patch.
>>>>>>
>>>>>> On 4/3/25 19:34, Hans de Goede wrote:
>>>>>>> Hi Nitin,
>>>>>>>
>>>>>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>>>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>>>>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>>>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>>>>>
>>>>>>>> This commit adds support for new hkey 0x131b.
>>>>>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>>>>>
>>>>>>> Does the EC also actually enable/disable the camera in response to
>>>>>>> this new hotkey, or is this purely a request to userspace / the OS
>>>>>>> to enable/disable the camera
>>>>>> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
>>>>>> ?
>>>>>
>>>>> Ok, I assume we can also get the state (enabled vs disabled)
>>>>> e.g. from the event? In that case the events should be reported using
>>>>> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
>>>>> state and set the switch to the initial state before registering
>>>>> the input device.
>>>> Enable/Disable status will be determine in IPU side which receives
>>>> notification from EC. So, the only way to determine the status would be
>>>> to determine the status in IPU side.
>>>> So, purpose of this patch will only to avoid "unhandled hkey event"
>>>> error from thinkpad_acpi driver.
>>>> Please let me know, if i am missing something.
> 
> We don't want to just avoid the "unhandled hkey event" message,
> we also want to send an event to userspace that the camera has
> been enabled or disabled, including information if it is
> being enabled or being disabled. This way userspace can show an OSD
> indicating that the camera has been enabled/disabled similar to how
> we do this when e.g. the mic is muted.
> 
> This must be reported to userspace using SW_CAMERA_LENS_COVER, which is
> what all kernel code which reports camera shutter state
> (be it a true shutter or hw blacking out of the image) is using now.
Thank you for your comments , Understood.
I have received ASL method to get camera shutter state. I am modifying 
code and will send next version of this patch soon. We will report 
status from this driver only.
> 
> Or maybe the IPU6 driver itself can report SW_CAMERA_LENS_COVER,
> assuming the IPU6 driver also receives an event when the camera
> shutter status changes ?
Please ignore my comment regarding IPU as we will report enable/disable 
from thinkpad_acpi driver only.
Although i need to confirm it but i came to know that "shutter closed" 
icon will be displayed in Camera View via IPU, when shutter is disable.
> 
>>> I hadn't thought about this - but we need to be able to track the status to make sure (eventually) that the right status gets displayed in userspace. It would be bad if it was out of sync with the IPU.
>>>
>>> Is the initial status always going to be disabled, or do we need a mechanism from Intel to probe the current status?
>>
>> I need to check regarding this but AFAIK, we don't have any other mechanism to probe current status. Also , there was some security concern involved in this which i need to clarify.
> 
> I don't see how userspace knowing if the shutter is in open/closed
> state impacts security. Userspace still cannot control the shutter.
Ack
> 
> Regards,
> 
> Hans
Thanks & Regards,
Nitin Joshi

> 
> 
> 
> 
>>>>>>>> ---
>>>>>>>>      drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>>>>>      1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> index 0384cf311878..80f77f9c7a58 100644
>>>>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>>>>>                                 * directly in the sparse-keymap.
>>>>>>>>                                 */
>>>>>>>>          TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>>>>>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>>>>>>          TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>>>>>          TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>>>>>>          TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>>>>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>>>>>>           * after switching to sparse keymap support. The mappings above use translated
>>>>>>>>           * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>>>>>>           */
>>>>>>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>>>>>>          { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>>>>>>          { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>>>>>>          { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>>>>>
>>>>>>
>>>>>
>>
> 

