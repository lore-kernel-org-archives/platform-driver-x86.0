Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E818BBB9
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749055; cv=none; b=SnWO8wm5Qsrn5lGLXrw3u1oGCAtPZW7/AOkmlg1hN9vh9b6lS9oeQEpV0txOvmG8zI5uPz0n5KUjOFyHELXWAMLdDe/UwTyBi7FSsXsCX2K6cQFzEFd6s9Y4D6kmXvcuWf5n0qjYmIZBr5mthihy29i50qF6V26QlugSTgg+NgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749055; c=relaxed/simple;
	bh=6uyIKABrTnhOTedbS0vKF8SN6Pq79QsminQi6tk/9g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUfAARsPsgmuuaZnoI2vBW2puMeMRveILR6pMpDrf+k8hYP8CW6dloUvKifk3AwE3esmRENPx22JIHT/WfhM5ImMQP2XQSrTblN3TY/H2BlSdmJfwviPZehbtdLlA0ivy6nO7f2vyX0Pul95NMFtMDWZxR3xTgJhm1B5jafrWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnqnpRgQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnqnpRgQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736a72220edso1717204b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Apr 2025 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743749053; x=1744353853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNlVJpPASFIhWAtdOSZFHn/5jlS4FNxowbfIqvbLjw0=;
        b=nnqnpRgQ9J3jWSaU6fa5uBiUKywTAK5ckUTpxF+5j6ZSDxwpD0NB5ou/MOlrfP6nFQ
         JyO6L+XPINNMikOWr6qaEKS2A2aDZE5b6U/QaVQfjtKqFybWr6lj8awBqklBJLz4ur7Z
         /k6iTMzkuzuS1hLd25tqqD2nAolcz7vzIDh9s332JS/Z17I/k+xoVx93K2wX/z2CJx0w
         ZDbSZZpuL+lY+2I6dMX7zFh16Awh5rElOeE6xPwerC/GpKdLxDFTt5vDTGu/n21e648S
         UpdLfBNylmw9kIsS2qLD1sci3MGS9lD1jAKth6Y2vGyqdJFGoEVJt5Kufr62760unlrq
         GZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743749053; x=1744353853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNlVJpPASFIhWAtdOSZFHn/5jlS4FNxowbfIqvbLjw0=;
        b=neD2E6go2BulE5Vx2dIut0FQkycIJhL1G8kGP3nk3QFOx25xHUOZBUNvaOm8AAJ3DS
         DgpIWSXMRIQ39P0+gxdm5Tuv9cUk1OVIVNPLeQVtk8FzMxVJFJ6wFtV/5h0RrLQcO6oU
         d+HZYiIZkSf/p28UIQCMN3o83Z26qQXjrJHaJhSzdfK6WNoqRPgFkQanjXegyVK0cEcy
         NdbYXA9L3Bw77hCUyKQI2dwEeU4VKfhIh1xeascDMI6/phbfK6Wsk1WuRNgR1f8XJ8Vt
         lnEJ02kShzZekfXztvxDSiDg2EEGUCGjV0D5O4l0DpRzz8whmGk3YNgg+N44HuqD9p7+
         /dZQ==
X-Gm-Message-State: AOJu0Yz8PMWtAnbR4DnCnJPS/UY0tUN8vjlzY7TIt12XxGSGsMXhOA+b
	+FFGn4QdLH51xOcWwRkyexRiPAYbfhutLPwSo6N01v15jWsUv6MS
X-Gm-Gg: ASbGncsrZqWCARg+VOueY9dYfkX/uTPJ5Vugrzs4LuYwa85CboNnoe0hhbrECQNYCum
	/88gLYQk6kK5JR+IAxI+vqWochzRmEtJNVyhbeRy2ruuqR3Xicybzn22UHSP8lp1P0NYpe1dlKT
	hF3c5VsGMatikT5g2D0yU4mSO46N8MQzLw7RypawM3WEe814MoLWeQ/HN5gjd6X2RGw7YpNOMeW
	6ztCHk062CXa0TzI2V9tIai84NIiege5ipZL5u4401ONk+BfiWoAoDCeiSZ3yae3NFPrUSGmUax
	U27JTe1Fo3Wa6VafENJDbbbNjtWLgn9QkNWHxj3fILNJULibWIJg9ACNO0bHKIGS4Tuumas4biq
	Nu5j+rjibWAK9j0HUO6MXLGE=
X-Google-Smtp-Source: AGHT+IG0TMhAXC2ugfVHkrK0mGxnqJNrZmHZSZr9HGKP6Os1gSCjLTb7CE4yUj/nk7Mswz0Hqy2V0g==
X-Received: by 2002:a05:6a00:c94:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-739e4b49c26mr3288953b3a.8.1743749053029;
        Thu, 03 Apr 2025 23:44:13 -0700 (PDT)
Received: from [10.131.178.61] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2cccsm2601092b3a.121.2025.04.03.23.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 23:44:12 -0700 (PDT)
Message-ID: <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
Date: Fri, 4 Apr 2025 15:44:09 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 mpearson-lenovo@squebb.ca
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hans,

Thank you for reviewing patch.

On 4/3/25 19:34, Hans de Goede wrote:
> Hi Nitin,
> 
> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>> has new shortcut on F9 key i.e to switch camera shutter and it
>> send a new 0x131b hkey event when F9 key is pressed.
>>
>> This commit adds support for new hkey 0x131b.
>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> 
> Does the EC also actually enable/disable the camera in response to
> this new hotkey, or is this purely a request to userspace / the OS
> to enable/disable the camera
Enable/disable is actually being done by EC. Camera enablement for these 
products are still in testing phase.
?
> 
> And if this is purely a request is there some other thinkpad ACPI
> calls we can make to actually disable the camera or should this
> be fully handled in software in the OS / desktop-environment /
> camera stack ?
> 
> Regards,
> 
> Hans

Thanks & Regards,
Nitin Joshi

> 
> 
> 
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 0384cf311878..80f77f9c7a58 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>   						   * directly in the sparse-keymap.
>>   						   */
>>   	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
>> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>   	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>>   	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>>   	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>   	 * after switching to sparse keymap support. The mappings above use translated
>>   	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>   	 */
>> +	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>   	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>   	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>   	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
> 

