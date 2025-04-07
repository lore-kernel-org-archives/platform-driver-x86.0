Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC95288A5
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743996604; cv=none; b=Zq2Cpd2g9RjFpObvwIfOReF6OBGKIqXv2A+pN8dWD/A8bk4697nzHBOI583sBFbM+LFeYie/rkKkcVb36xu7vY2/67iPzwskh0Q/mE4/MRlSik/i0rx3+wL9qG/eVs4cwRO5G2e7BrwmRDjmJ2F0GiejfCWO6W5nNumAGKzeX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743996604; c=relaxed/simple;
	bh=CaU7NbeQkz4hreCpH8FrsCBQN3WCvEAW7jXBqizon5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeHlg8By/gbPvnzThol842w+thG0AU+8xC8txI5/pVae3zsf3ZtTml67SdfJU+uSHnVjiA81yKATWRqxk3wccEkrJJu4ylJnom4N/EJi/cxCmiOqNzesiE0HB/b0Xwxo2dtfThS0vwcqv3nPN8fjvlo+YHY4ghtkvlBLHEtnreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFzc9nVQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFzc9nVQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227a8cdd241so43595205ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Apr 2025 20:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743996602; x=1744601402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imYotGVS6Vr5WIIQVsWM+1SkX6AOoAjFRdt5bDtgeAA=;
        b=iFzc9nVQ7foA2SouN8tSZyIr+gE0lgEFzLFN+Qml0DjCBUdh2pbVoVcSNpsWdxLyTl
         ucE1Vczou6dEt38IsWYjoV90Dv5ezIGp9JIPyncbV4CSyQX4F0yA6oT10mGIaIZMWYeE
         OofrRQaUn1yiFoH/XOvv2jrLMfQKSg073aD8NhkOjiFEpSh5sI3GULRWCEMDv/fbJclB
         Afa8DxpsPbQWSUmfKUj2pfuAujPQeP1O8Ubk9ww0he+LEjBhNZTIkftP3rcza0qO45Fo
         piK5kdswP1PpmjcJEj/u3nyEdZ+HZq1Q53xavKL7xnSdz09QjRS5BhqIDOM4FPcZiKMT
         DU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743996602; x=1744601402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imYotGVS6Vr5WIIQVsWM+1SkX6AOoAjFRdt5bDtgeAA=;
        b=YZIHQzl2tZ/6SDoKy0vXLUROpSdOQvLjNVcsw26YruO+wIHac+mBNxQGE7Yr1ES3E+
         nmvK8Lav/T9HtzIlEtRxIOUeQ1PIV5I449g0kuEDiaaSMK8O+RnNEa7YB6vlwtZ6Gr68
         qd8GUqDpaIiGwMy45AjxrgKTsgX0tm4mR0qzoZiIpCKzCVOSyUXzfNT0RLuhE0We6Mut
         r9Er4BXGXnqxdQAJ9f3gP+ZGN93eqn7jGzVQBijk42hZ0HJpm04Qg3x+VVFK/gRLs8qr
         Ao2AEthIeFWwOAcuvuVUihgN75R1lNZ08LVjWmHWPAuf7HpU5b4r+gn9KK+TpdKjTyWr
         gJVw==
X-Gm-Message-State: AOJu0YxJjDNySyOUTi3Jkhgq5yGAClO61/iRVENRTlZrq5XY29HiCypJ
	artbxjW3+EYjQee+UXxmv03KyT3bAIQbefKcTCRbFJaG0nSB1a2dOuph4XHdc/E=
X-Gm-Gg: ASbGncuoChjURJ2I4EVXdqbztiSFM3vA5woeL5U8BNRXUCTlrLN7teM4Id67ylTtImj
	5F/7Mh5m1pHe8EivagW8CeiZGOzge5lpSpB4m/qe0HbQ8Y8MCn12jj3TTPmOJOaUh3NpVJhJB7/
	+BNA0M8Sk/4bsqCLo74RjPgjRJnxhfDB9M797ysqkmCr1zsr6X2HLivAaT8PzN2tVh62zaPBVaI
	JcWCCv4rc1fsNtq6gEFUOeXi3goNK99CcsrvN+RwwgXkb7FtAMwItroHJMymBbGFrJgsF5vqDoM
	UR8tBy404z9LJplGCGFqWqWOgIh3S+2YSwgQ8U4blVwdp+4dmg+HqM09zeF3d3oPtXVgkJjOGBl
	ExdtwzCvWSeTElF0MLBTHo5k=
X-Google-Smtp-Source: AGHT+IGpd5kyXByBDCnGlQVEDq/p/wnpbCK/Z++eVKnowoCaNU7ucIEMCb8a/Oceb/YU+4ngrxPz+Q==
X-Received: by 2002:a17:902:e805:b0:223:501c:7581 with SMTP id d9443c01a7336-22a95511e49mr102986155ad.16.1743996601712;
        Sun, 06 Apr 2025 20:30:01 -0700 (PDT)
Received: from [10.131.178.61] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877286dsm70483915ad.216.2025.04.06.20.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 20:30:01 -0700 (PDT)
Message-ID: <f9256d26-6d74-4526-8ec8-3ea7edd01792@gmail.com>
Date: Mon, 7 Apr 2025 12:27:42 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hdegoede@redhat.com>,
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
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <255bb094-ad3a-4711-866f-659b2687c929@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Mark,

On 4/5/25 04:23, Mark Pearson wrote:
> Hi Nitin,
> 
> On Fri, Apr 4, 2025, at 5:02 AM, Nitin Joshi wrote:
>> Hello Hans,
>>
>> On 4/4/25 16:25, Hans de Goede wrote:
>>> Hi Nitin,
>>>
>>> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>>>> Hello Hans,
>>>>
>>>> Thank you for reviewing patch.
>>>>
>>>> On 4/3/25 19:34, Hans de Goede wrote:
>>>>> Hi Nitin,
>>>>>
>>>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>>>
>>>>>> This commit adds support for new hkey 0x131b.
>>>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>>>
>>>>> Does the EC also actually enable/disable the camera in response to
>>>>> this new hotkey, or is this purely a request to userspace / the OS
>>>>> to enable/disable the camera
>>>> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
>>>> ?
>>>
>>> Ok, I assume we can also get the state (enabled vs disabled)
>>> e.g. from the event? In that case the events should be reported using
>>> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
>>> state and set the switch to the initial state before registering
>>> the input device.
>> Enable/Disable status will be determine in IPU side which receives
>> notification from EC. So, the only way to determine the status would be
>> to determine the status in IPU side.
>> So, purpose of this patch will only to avoid "unhandled hkey event"
>> error from thinkpad_acpi driver.
>> Please let me know, if i am missing something.
>>
> 
> I hadn't thought about this - but we need to be able to track the status to make sure (eventually) that the right status gets displayed in userspace. It would be bad if it was out of sync with the IPU.
> 
> Is the initial status always going to be disabled, or do we need a mechanism from Intel to probe the current status?

I need to check regarding this but AFAIK, we don't have any other 
mechanism to probe current status. Also , there was some security 
concern involved in this which i need to clarify.
> 
> Mark
Thanks & Regards,
Nitin Joshi

> 
>>>
>>> Regards,
>>>
>>> Hans
>>>
>> Thanks & Regards,
>> Nitin Joshi
>>>
>>>
>>>
>>>>>> ---
>>>>>>     drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>>> index 0384cf311878..80f77f9c7a58 100644
>>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>>>                                * directly in the sparse-keymap.
>>>>>>                                */
>>>>>>         TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>>>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>>>>         TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>>>         TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>>>>         TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>>>>          * after switching to sparse keymap support. The mappings above use translated
>>>>>>          * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>>>>          */
>>>>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>>>>         { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>>>>         { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>>>>         { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>>>
>>>>
>>>

