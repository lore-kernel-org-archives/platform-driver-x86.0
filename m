Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371142;
	b=ebC6UD00tDPheaUz4b1XNC9VYf0Ywk7UYo6DS02FDEscq5quqHeEbvzMH9aYz27cuBfu
	 YtH5Ko58u72RqbV/EVYEIQpVYFcCAe1e9hfJMO18tcTdOm9Gc8UJvUi2wFYqcC16hfBv8
	 gZGvCzbUMObK1M+wiZFrhoW0xVavFoUb5rYzsDr2FjiIP8BiQ5TjyffsyGaZPAE1QLJJ5
	 fi7JYl/tOd28mOVL8G/hwzjnwk2k7xhT0StLcYafZumpMAm3khAE1KknsdZxqSQXa6V5H
	 14wodZjHPRppztPQjoJeN3hPN1jTmlajX5v3ORhi29AFEObsBW0cV7fAylUDide95SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371142;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=X+jL5QP1zfJdaJr6lj9TVIyYJXOirbw2bMK3zOxIKfs=;
	b=06rUTE03P2fJwMTGz6Uw1345LpWL8JbS+tI7uxk2VmG6B5GuBL62X7r4uBJYsZHtRaML
	 BzoB1ZXgCrAugTWV9DAgo8Pyu7e+rUku9QgOfVPnzOiGSN7bUvZQfhwAqXdk21ajtURKq
	 /sH1bTjTqDBrJwCjFvMVctzTtE8tt4wptoEJF3au1+a66HS/gUOdCGsf1WtBR4Xh5QuDt
	 z0Gjvi/maYgiOmwxVuUvppSU5qvxvAaF+StZNbP6l1jf+NtlnPcRX/2buWr6Yotxdl7KI
	 5ohQzoTO+FyLAHVziwsEoM0KkQoNnIhQC7M0BFLYE0jrx+vPcdvyMvrgdCrAnuJEuZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="KxZxh/Ba";
	arc=none smtp.remote-ip=91.218.175.219
Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B57606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 14:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KxZxh/Ba
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CZy0RET86SHEJl5kUZciGQmm2ZhwcBOzdF3dtCdmBiY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793371138; v=1; x=1793975938;
 b=KxZxh/BatzLytPQ4Nb0VSLv/tPnefBqmyi4sECimMXtm3nlOfeKd1lXx1YArst4FDcNsGO6R
 C7Ml88uWIf1o1dxG6+GLyqeXIqcDVFM4DyPIo4wnAFwOAVdeD0N/CAF+O55vpuoK16Nktr3JNJc
 vIOgxmRqKxkoVeIU4sr4ybr0=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aa867f3a93bbc39b;
	Fri, 30 Oct 2026 14:38:58 +0000
X-Mizu-Trace-ID: aa867f3a93bbc39b
X-Migadu-Flow: FLOW_OUT
Message-ID: <6361f6a6-3cfb-4eaf-babf-be548f28f2c0@linux.dev>
Date: Fri, 30 Oct 2026 15:38:57 +0100
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
Subject: Re: [PATCH v11 07/18] HID: asus: add support for response curve
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, kernel@lists.opengamingcollective.org,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schwartz <matthew.schwartz@linux.dev>,
 Denis Benato <benato.denis96@gmail.com>, Jonathan LoBue
 <jlobue10@gmail.com>, Khamunetri Clark <khamunetriclark@gmail.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>,
 Ivan Levchenko <me@livan.pro>, Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hansg@kernel.org>
References: <20261025235232.129945-1-denis.benato@linux.dev>
 <20261025235232.129945-8-denis.benato@linux.dev>
 <7688fc40-c439-005f-6a78-efdc39356694@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <7688fc40-c439-005f-6a78-efdc39356694@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/26/26 14:06, Ilpo Järvinen wrote:
> On Sun, 25 Oct 2026, Denis Benato wrote:
>
>> ROG ally devices allows configuring the response curve of both joysticks,
>> therefore add the ability of userspace to modify the response curve by
>> exposing relevant sysfs attributes.
>>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> Signed-off-by: Luke Jones <luke@ljones.dev>
>> ---
>>  drivers/hid/hid-asus.c | 297 ++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 294 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index b4bc89ec28bc..e1883ee20413 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -22,6 +22,7 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/ctype.h>
>>  #include <linux/device.h>
>>  #include <linux/dmi.h>
>>  #include <linux/hid.h>
>> @@ -185,6 +186,18 @@ struct asus_touchpad_info {
>>  	int report_size;
>>  };
>>  
>> +struct ally_joystick_resp_curve_param {
>> +	u8 move;
>> +	u8 resp;
>> +} __packed;
> Add include (if I didn't mentioned it already with some earlier patch,
> I don't recall anymore :-)).

Which one? I only see drivers either not including it directly or highly hardware-coupled including the one
for the architecture, what about a driver that must work for x86 and arm64?

