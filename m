Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992561;
	b=ypuDtX2zxPYb3FJgKkqrST71qV/4FOgzTEgNgNiQxEuvDXITgaHHoVpgLhoI8R5OYPfJ
	 DDp8+LfshhlgOIzgxCJUNPOWhFQ0HzRN2D4zm2JsvGRcVBF6SutHQifp3ZqGOjIMToSYM
	 LJXsy2tDhc/FiVTqyrfbnLQEx2J/6xaBtl10Mo93nk1nPgineNBCdCEKHku9O5yfgaIaU
	 2WxIGZQAaI7iGBTD9ZpuXHjbMlUfITBdjgbQF5Un6ZjMdvIOi9toYDSOhRbPQXwvafnw4
	 usbEZl0xiDtf9ENwNNsGumCBmPEl6cB7D6a8IY119qbNU7Sf7axf+U7aW72tIKbFDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992561;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=T4br/JTRtuOeQXNbxTr1lTINRIbReqKZMmCRmxi6A8U=;
	b=OqcJ7A2YLka2vhusBJTI8eeZhhzJRtHJEg5tCCMkoa5Dr1LDFiN8IPSaCDHSJcL/iDsJ
	 A9sVC8e5h4AiNsyScOjkMBlaOync7JUSZ6AU2cL/bI9l2UpOSvNUlETsroWPIv67mPjXy
	 fbxnO6c2JQhJ1hla5izRpaiVggKFJe2tu2ToHpSa+6wl3Ji/XwnLUhUl4ppaBYFaHicda
	 +yCoDpo8tuYsgqZ50bPl5YifuiZ6Wv/H5fYrd27+CQPPamME+TjomHvr/gUZO2b5wcKG1
	 LL0pHc9msEIXvdlnraXW4xxlnYkLX/ZlLl4E/bX3PByD1Qctg/FrFrV6ZBrLsDwvKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=doubly.so;
	spf=pass smtp.mailfrom=doubly.so;
	dkim=pass header.d=doubly.so header.i=@doubly.so header.a=rsa-sha256 header.s=MBO0001 header.b="Qucvu/gQ";
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC874606A31C;
	Wed, 18 Nov 2026 09:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC874606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doubly.so
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doubly.so
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=doubly.so header.i=@doubly.so header.a=rsa-sha256 header.s=MBO0001 header.b=Qucvu/gQ
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jTwbZ5NvQzKp3c;
	Wed, 18 Nov 2026 10:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
	t=1794992554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4br/JTRtuOeQXNbxTr1lTINRIbReqKZMmCRmxi6A8U=;
	b=Qucvu/gQzOT757m/mqWWQU7gjffYNPjf4MDBwav6pLHKqTPPKzXCo8ZbtuphA3hke2Tpxo
	S2o58MrZ7DvRfUJPaUBqAHVckUzk9+yxGOwpsFV00NOnoWxuzZavyZIbSIT/7avflImJI7
	cge7dVxlKlQTlybq77RhNhPprlie9MsDDFIjbMOAqqceLsPkWnE8dcJqWlqf1cFHuRYEqM
	b+37Bsx8hhguJKMt0LadpeqxfUkN64JSp6GESYozETNM3UadkE4w2uSqGA4SSNaDuazHvg
	pKz0CiRKMMlaE86Gc0T6XZvdAnQ9mBG1I6FJhMibPehDeAR5T1Q1HYQoAV9Trw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of dev@doubly.so designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=dev@doubly.so
Message-ID: <9cbdb61b-9c49-4b31-a28d-022500b271a5@doubly.so>
Date: Wed, 18 Nov 2026 10:02:32 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
To: Rong Zhang <i@rong.moe>, Denis Benato <denis.benato@linux.dev>,
 skyedryv <skyedryv@gmail.com>, git@turtledev.nz,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Jos=C3=A9_Guilherme_de_Castro_Rodrigues?=
 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
 <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
 <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
 <4c7d100f18820cba7c4fe6f6fe50c6e3324504cc.camel@rong.moe>
Content-Language: en-US
From: Devin Bayer <dev@doubly.so>
In-Reply-To: <4c7d100f18820cba7c4fe6f6fe50c6e3324504cc.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4jTwbZ5NvQzKp3c



On 17/11/2026 14.52, Rong Zhang wrote:
> 
>>>> When a device has both ASUS_WMI_DEVID_CAMERA_LED and
>>>> ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_available is
>>>> false and the LED device can't benefit from brightness_hw_changed.
>>
>> Does such device even exists? Can it exists?
> 
> (+CC Devin)
> 
> Both macros were added together, i.e., in commit 4bf1ea3fc914
> ("platform/x86: asus-wmi: support the disable camera LED on F10 of
> Zenbook 2023") for Zenbook UX3404VC, so I assume it has both implemented.
> 
> Plus, the name "_NEG" sounds like it was concluded through trial-and-
> error.
> 
> I suspect that the two devids were defined for different purposes, i.e.,
> 0x00060078 for notification and 0x00060079 for query.

Hello Rong,

I can tell you what I know. I discovered the arguments from the ACPI 
metadata, and found that writing to both the CAMERA and CAMERA_NEG does 
the same thing, as far as I know, but NEG 1 = other 0.

They control the LED and the camera.

I don't know about query and notifications.

The hardware key doesn't do anything if it's remapped, at least in my setup.

>>>> It'd be better to decouple the brightness_hw_changed path from
>>>> !ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be able to
>>>> emit the WMI event.
>>>>
>>>> With that, how about adding a wrapper function that dispatches call to
>>>> either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
>>>> asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to the
>>>> IDs' presence? Then you can share the same brightness_hw_changed path by
>>>> calling the wrapper function and eliminate the need of adding a dedicated
>>>> brightness_get() callback in the same manner.
>>
>> I'm not understanding this: first the discussion moves toward "what if one
>> device has both" and then you ask about reusing the code for the non-neg
>> dev id.... What am I missing here?
> 
> Because I assume such devices exist. Perhaps Devin can give us some
> clues...
So it has both, I don't know which is more correct. I just documented it 
for posterity.

Cheers,
Devin

