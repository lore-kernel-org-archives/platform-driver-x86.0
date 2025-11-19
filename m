Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406DF21D58B
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 00:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513686; cv=none; b=J3G4qaVKhFfwQTE5WM2V9aD6jNoKifxGB/fk7p674FKXeDIpQ7B8qtSGXfFzOt6SSzozknpRvcNV5KnHZUyv7/d+gXdDhNiZia/XpVvwdTi/rL1XtxYxVwE9Qx2fW4ASDxwH6byVIJtSsJhGn5zICjdFneNPHMcX8niTh5NJQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513686; c=relaxed/simple;
	bh=S7cBkVtaWV5vTOafbIcXZKiTf8IWOP3AHqjv2LF1juE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ae0TLLZZA/6/3l1uEx3PcZo5/7TY454wfFBAVR0dVoY/SMIfvnXEGbwwjcMYmLPxpAqKjXI4uGxlgRzGOrfHZPz8Vx8JWtlDzImo1NznjrEyAMgccSvikqvhVsTxEvDeZXmgccyLK616JM1Hr9j7vw3qi5os2p47BfmUvR6ExYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvC8mr9p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvC8mr9p"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so39179505e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 16:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763513682; x=1764118482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tD7UHGbxqyXuRW2eROKXZRUdScQ/xRcJrNBgG65enFE=;
        b=cvC8mr9pIsd5oP7zQfZKUb21rzJX6LqSb/UVft5dg7UzlNUnETDK9C+8D+JsJtw1VQ
         1Z1FDG07RN6koQhD4tTXqL9OUPZIGveVninQgoyX/xhcT3Z0dS1UvsueZzcuLiyPV/Hc
         IAim103Nq0ZMK6iggF1DS/bQ818ZrOIRPe9lJz31xMbrRagVPehVHPucx4rxkrfnzPoP
         kNAM1PxycznEv47XIzKdIPbaajFCQhfn0Ol1pRYlVqaPNaPgjp20Nf+IRWVeXP+AwjoG
         rw7CIAlRXKvGAZuwMX3oJ49DKJFbXKytitotBiNC6hohBBVAlir4skczLjRxBqXApBWh
         RKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513682; x=1764118482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD7UHGbxqyXuRW2eROKXZRUdScQ/xRcJrNBgG65enFE=;
        b=iupR5ucYP4/Mxi9MTK5gMeHHzA+PaWdV9COgEOnGOedSY3uI3TIzJMqcxhaYyly//C
         QywNzvvQVmfMASzx2iDugOLgEwmHDwB00a4efSUyk09jcbS4LNrGMVTJ8QLJkxMyRJnK
         rCzYfGLF2WLpn5GdEpOb5vPT4PZMYSULy7Y/mPy1Il62wwW/6bznAtcpDUjOvKbLFryd
         0nJeKlLFCw9Xvq4hKn31ISNAeOgNWSRRXSwz9XRHcGqi8WnKHYTL/1t4wSi5AvdZ51Rs
         lllHwrR7vD61d2WZOF5IBnydPVs0KjgCvmwDq2VM3Hb9Di+FPv9E4BBNx7Oxn8Nfhmoz
         qTJA==
X-Gm-Message-State: AOJu0Yz/AmG/ZO4xrmL42XpYS6ZWpbxas60/PED5+ugCX0tHWQLhJluC
	0CjcAdTqTg5MC/eKw7SHFZ3ivt/lBCY1TJCMSGyDi0XLVZOgEmcV2xPX
X-Gm-Gg: ASbGnctxjiBwNDEKHICYukpCAK/x5rZiw6Wd8Zqx/xTmYiwWb0w+lisvkhi/T1AK6yT
	azOd1XEpJK8h1mzVmVt5D2zGf4KSlr+I+zA10E3PT77+43xim/+mMVnTnM5zmQ3oN4Z5mM1fdmT
	txaKGsbg2vQfRN8qQwFf0DNrkqXd8/xGvwE5auxD9Dw+3JiYPTTFvmz930oJEFa7UHMd8iJbFvI
	nyLm8SjcGYKcX2FSGHRmpqIGYdLRrJzzzEcmvpSmtgQsmFsd5tQTk8HvHPxklp6zkpmaPwvmB3C
	yTUyT5dB8R/7R5xqIV+PiM43zu9Pqje18DcLQ6raiSmkAfPx9fCjhEsB/DAGsEpAvAN4nhfDYCK
	0jLpOHhVW/OYAvFfF0BvZ+tvqGDWbsl+G4jtdUiY00NJhLjyhEKB9HXactA/X3QHlFTCLtGISWk
	wAjcNvM/fuvcigG009plAQclGQ5BSLbttbcFvIWQaAX6pw
X-Google-Smtp-Source: AGHT+IFmF63lqiJu3N01t8hhMet7gN17SA69AgiylLzyVwUF6QLmjH4zQF2+1EZ0wzGmSPPrQ+Sbxw==
X-Received: by 2002:a05:600c:6289:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-4778fe50f5emr164310575e9.6.1763513682262;
        Tue, 18 Nov 2025 16:54:42 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106b03bsm16988325e9.9.2025.11.18.16.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:54:41 -0800 (PST)
Message-ID: <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
Date: Wed, 19 Nov 2025 01:54:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/25 13:10, Ilpo Järvinen wrote:
> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>
>> These keyboards have always had initialization in the kernel for 0x5d.
>> At this point, it is hard to verify again and we risk regressions by
>> removing this. Therefore, initialize with 0x5d as well.
See patch 1: unless I missed something you can retain the two 
FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
why are we adding a quirk to replace a quirk that was removed
in patch 1?

You are basically doing the pretty-much-but-not-quite
equivalent of what the driver was doing before.
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> ---
>>  drivers/hid/hid-asus.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index 726f5d8e22d1..221c7195e885 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
>>  #define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
>> +#define QUIRK_ROG_NKEY_LEGACY		BIT(15)
>>  
>>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>>  						 QUIRK_NO_INIT_REPORTS | \
>> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>> +		/*
>> +		 * These keyboards might need 0x5d for shortcuts to work.
>> +		 * As it has been more than 5 years, it is hard to verify.
>> +		 */
>> +		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>>  	/* Get keyboard functions */
>>  	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>  	if (ret < 0)
>> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
>>  	  QUIRK_USE_KBD_BACKLIGHT },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remove 
> + add back in different patches.
Granted I still have no idea why that was removed in the first place?
Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?

What's the problem with FEATURE_KBD_LED_REPORT_ID1?

> I suppose the cleanest would be to add a new patch as first which moves
> asus_kbd_init() outside of if/else so you can make this refactoring of 
> FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
Again I am missing the point in moving these...
> I note there's still contention with this series overall.
>
There are a few things that have pretty much the potential of making
some laptops act funny due to tinkering with initializations commands.

The rename will break some tools, but other than that, granted I have yet
to check the rest of the patchset, looks reasonable to me.

Perhaps I am not entirely happy with how things are worded in
a few instances, but it's a minor issue.
