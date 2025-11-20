Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B286D531
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606672; cv=none; b=cgIk7Rm73743EPunxfFwRB0Epo5AXJCYog+CUVaMVMoAW2cZM8s89/3CVnydCXM30ksuFaq/gaYvzH9Tvk5c8vtSwgCUrubJu3ydPCYZpM/TplGHBSUjtvr00fYJAoJI26mUlUmCgX+rwBBJHtGftwb9ZpSLLu4p+5v/fO3buT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606672; c=relaxed/simple;
	bh=bajybE08yTRCcXfWtT9pWH4EkieOuB6SsxosPh3mZDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXfTk5yFqFVv6jcBRPCycGYWUDP0j+lyMNfsR8IZSR+2FZuWw6xG8WlWS4CfGyUyqeXD1yfjlWTpVulBLTmn1axypQ/zc1pY21zylOhBVKjose0klOuWToHWJA3M8tJqvmTiK4ViK/i0WHRLE3phBMxSVhoset4pI5lIVUiJPiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N/NAAa6o; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N/NAAa6o"
Message-ID: <5c8624ca-e7ca-4003-b5ca-ef7ea5889adf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763606667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZHyFYQE+4Teb38teeU41WJs+H2wrGpcYyX7A+H2LeU=;
	b=N/NAAa6oYAST84KTiidcN5DOK0mYZvcj4rP5KvQHmfeXyy4FCBIO0ZnRnxcd2a1Kmqhp+9
	sK7ZgW2Hc1wVCvzlT25QSyfFensphQ1a43YvYOTO+9ztslusZUc9HQTO2KJLjppvYlXKJZ
	pXoY6oNBeZpciw/sp7Y9LuPRW3fc4Hg=
Date: Thu, 20 Nov 2025 03:44:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [bug report] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
To: luke@ljones.dev, Dan Carpenter <dan.carpenter@linaro.org>
Cc: platform-driver-x86@vger.kernel.org
References: <aR1xbxEQyQPEvB9o@stanley.mountain>
 <E8438648-F06F-4CA2-9F12-8F9A7258DAEA@ljones.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <E8438648-F06F-4CA2-9F12-8F9A7258DAEA@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/19/25 08:46, luke@ljones.dev wrote:
> I’m not working on this. CCing Denis.
>
>> On 19 Nov 2025, at 20:27, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>
>> Hello Luke D. Jones,
>>
>> Commit f99eb098090e ("platform/x86: asus-armoury: move existing
>> tunings to asus-armoury module") from Nov 2, 2025 (linux-next), leads
>> to the following Smatch static checker warning:
>>
>> 	drivers/platform/x86/asus-armoury.c:429 mini_led_mode_current_value_show()
>> 	warn: iterator 'i' not incremented
>>
>> drivers/platform/x86/asus-armoury.c
>>    399 static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>>    400                                                 struct kobj_attribute *attr, char *buf)
>>    401 {
>>    402         u32 *mini_led_mode_map;
>>    403         size_t mini_led_mode_map_size;
>>    404         u32 i, mode;
>>    405         int err;
>>    406 
>>    407         switch (asus_armoury.mini_led_dev_id) {
>>    408         case ASUS_WMI_DEVID_MINI_LED_MODE:
>>    409                 mini_led_mode_map = mini_led_mode1_map;
>>    410                 mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode1_map);
>>    411                 break;
>>    412 
>>    413         case ASUS_WMI_DEVID_MINI_LED_MODE2:
>>    414                 mini_led_mode_map = mini_led_mode2_map;
>>    415                 mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode2_map);
>>    416                 break;
>>    417 
>>    418         default:
>>    419                 pr_err("Unrecognized mini-LED device: %u\n", asus_armoury.mini_led_dev_id);
>>    420                 return -ENODEV;
>>    421         }
>>    422 
>>    423         err = armoury_get_devstate(attr, &mode, asus_armoury.mini_led_dev_id);
>>    424         if (err)
>>    425                 return err;
>>    426 
>>    427         mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
>>    428 
>> --> 429         for (i = 0; i < mini_led_mode_map_size; i++)
>>    430                 return sysfs_emit(buf, "%u\n", mini_led_mode_map[i]);
>>
>> This loop doesn't make sense.  It just prints the first element in
>> the mini_led_mode_map[] array and returns.
Thank you both for this.

Fix available here: https://lore.kernel.org/all/20251120024059.1341326-1-denis.benato@linux.dev/
>>
>>    431 
>>    432         pr_warn("Unrecognized mini-LED mode: %u", mode);
>>    433         return -EINVAL;
>>    434 }
>>
>> regards,
>> dan carpenter
