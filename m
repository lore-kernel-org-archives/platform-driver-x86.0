Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096686;
	b=rWkXtNowBE1WZTrrQx2zPvpcYA3F+cCgbz8nCL9CKGZkLLlJY6YJJ2+JcN9Yirh/VL/O
	 d+i0paPP8v5CNadOO1pNRCbdGjFq/XL8yed/14fAVqAU02CMkMzIpR9gtCkYa84Go0Fnd
	 cwu/49HIOE3X5lcCGhSdtLolB8QGBG9Zkvm8RwaMbOnjZo0Ozx6VgXsfJRAtJfa/Ok/nV
	 ndt97fBRkROiUypWjDh2S8Ns71gFsEsV1Ow+RIFh5trHu0to+z+QxoS6gym4CID74XZ1l
	 JQGBicGbC8muh+ph4HbiD/9eUT9lrGXmb+UWf89QJlQSLPCb+rRgLKSXhZJeGMqwRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096686;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=CammqR360F23iddmKlrRjg23Umk9SMVqWuhiNcO7MLA=;
	b=v+E0GQowJMjxiMnqY6+1WvK+aZYGfEuOX87CpMTNhSDuTGkN1k7sJ2/dw8bBMPuUESwF
	 c8lMEkjTnLAOPtRBeORAihqZsGgVOA4dMblIZySkpfM686IxHjef225BuSfEZ0QCLFj+G
	 OPywlCcyXZyAkIAtaAckxy5rdts31vfeg4IPqvwPC0frhaPAGBJVyD4phf8g0xDiq5Yme
	 wXUAzXZyG2nHgqoCEfFB/qTx8vgK19k5i+EKFIEywQ1l6abzWiVPYHH0Vfgf2LrxJjSBB
	 O39vA+aD95WCv+96dChCXKW2zPYjQRhKXKoLlpmOOhWYZETf6bZ/a1yo6Kue2y/wOgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=doubly.so;
	spf=pass smtp.mailfrom=doubly.so;
	dkim=pass header.d=doubly.so header.i=@doubly.so header.a=rsa-sha256 header.s=MBO0001 header.b=s7koq+gY;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCFF606A326;
	Thu, 19 Nov 2026 13:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doubly.so
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doubly.so
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=doubly.so header.i=@doubly.so header.a=rsa-sha256 header.s=MBO0001 header.b=s7koq+gY
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jVg601c6zzKnNh;
	Thu, 19 Nov 2026 14:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
	t=1795096680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CammqR360F23iddmKlrRjg23Umk9SMVqWuhiNcO7MLA=;
	b=s7koq+gYMm097FM2xOpU0bVTQW5NN77+dRXWtCX/kFXeWpllqBMRJBQ1bUqfpRc0CHj5bN
	vQ5dtnZrO4cb3Ua0JmzLszfT4LOuiNV1kjmmnEw9tDKhbVv/UadlH17fKxEFuIXCVH9Zyf
	nUYIyDO9xbYEjpW0myT2e/O1ntuWmdKWHTSKJtVImxmuT4cvU9WdOM1lQTsF2almdnAJ5Z
	/stMgeimXqCgjcHXa9l2nOSFLTI8LNy3CQP+dKf6rhdH/yw+c7FP7jeuEHwMdohvcgd0KH
	dk/7S/Do1ikO3gDxZD4y+HifLgwDa2sezdBT1hjSfqa3laaZ0wOSeD8iPH8KzQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of dev@doubly.so designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=dev@doubly.so
Message-ID: <b4d1f79d-770a-4e28-86cb-c3a5fd9187f6@doubly.so>
Date: Thu, 19 Nov 2026 14:57:57 +0100
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
 <9cbdb61b-9c49-4b31-a28d-022500b271a5@doubly.so>
 <73a6179232b6db07014d78508c441a6013912e69.camel@rong.moe>
Content-Language: en-US
From: Devin Bayer <dev@doubly.so>
In-Reply-To: <73a6179232b6db07014d78508c441a6013912e69.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jVg601c6zzKnNh



On 19/11/2026 14.12, Rong Zhang wrote:
>> I don't know about query and notifications.
> 
> Could you test if any event is emitted when you press the camera key? See
> is_camera_toggle() in Zane's patch for the corresponding event codes.

Is this what you are looking for?

bpftrace -e '
   kprobe:asus_wmi:asus_wmi_notify {
       $obj = (union acpi_object *)arg0;
       printf("_WED type=%u value=0x%016llx\n",
              $obj->type, $obj->integer.value);
   }'

When I press the camera key, doesn't matter if it's disabled (LED on) or 
disabled (LED off):

Attached 1 probe
_WED type=1 value=0x0000000000000085
_WED type=1 value=0x0000000000000085


>> The hardware key doesn't do anything if it's remapped, at least in my setup.
> 
> How to "remap" the "hardware key"? Isn't the LED device only "remaps" the
> status LED?

I mean the hardware key does nothing - it doesn't control the LED or 
camera. The desktop keyboard key is remapped in software so the desktop 
doesn't disable the camera when it's pressed.

Cheers,
Devin
