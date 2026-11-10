Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279058;
	b=4McZpnLsn73SBbcuKTiF4llcMpPkv1ej0zILOf/ySKpQKCPGx0J77NZ/bRR4SFkZR20G
	 KaHvWh9RWtkRA7QF0rK+ncjynxIwdgG/lycLV1cA0JTKmtQcR7qxahB6Bxp0VjXtwSN1r
	 ya6O0NZRuxigsGfr/ctjQGqfnj4O5Hh/0o96n3k2PYCBH4jxCT2YSA06hWgxoCBcbUwnB
	 LVg1loQEKP4fcNM2U3mqotfU2X1PNDbYDrEx7sysqlgUl/2XS/KZW3yTi1UNDy2SiGy9o
	 hR0yL19SsTy/jvCJjAhs8CKK4xvxAR6/IPR86dEZUfcbtCxFkLZm0QCiVHLLO0kxpxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279058;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C8unCCHJYQwjY59pFoSyfbnbh+xaAmhUDTGx43WO634=;
	b=evRr1HGRdvM6mYTh3oxjL9OntAXqqORoq4vhfA0jFT/6N8Im37tzXUKtTovU0LM6Q76H
	 RQMBOr9AMcWJn/qbEs7DlvJ1kBv5sZUYpKyiyQGAKdO3gDmnpSqxy1JAw5I90C9vQlysz
	 2fiLDiTZr7FQKI1W6e9m8xTrNhdc0i7/jhb+hxFS/iWZHs2wiWSWqcqW+FkRQtupNtQVf
	 M5adJSeDOehhDWfmxIOo5b4DSBrOIrp/DVAfRXrJ9WzDJa8XPlmsABqXT18ZIDtztW6Sa
	 lfu+IGWGPWqk2HyiClh8Ea0nvuFOiqIdYA1REeC3ssIzVxYR2Jvz+N3oxd20bPvwUnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43E606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 02:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D43E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eD87Wy+Emd5tpWqwJtKKrbIiq9BHikxiL8HebslatJA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794279044; v=1; x=1794883844;
 b=ICQ1oRb4LotvW/3csuh1OkxuTmCjvnD6Egx/4JflMYnFbnwnEVPGFM0gedqkIszxk14cYIT+
 /s5096rYPpwrxOpx6tS58XdPpuEj5WYNZg+aVDspYu8B7URSmG5AH+meo1pMpKl6ccZehbSMGca
 9bDBs1F/jc3QyMTtu3hWaE0A=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4395f85f1f1d0f1b;
	Tue, 10 Nov 2026 02:50:44 +0000
X-Mizu-Trace-ID: 4395f85f1f1d0f1b
X-Migadu-Flow: FLOW_OUT
Message-ID: <9d9e53e5-aede-46fe-b0cb-747b95a816fd@linux.dev>
Date: Tue, 10 Nov 2026 03:50:43 +0100
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
Subject: Re: [PATCH v4 1/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bartu Alev <bartualev@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
 <20261029-asus-tuf-rgb-v4-v4-1-0d3b877d2c30@gmail.com>
 <cc9c8655-6f7c-05f9-ad09-4ea30f1dda95@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <cc9c8655-6f7c-05f9-ad09-4ea30f1dda95@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/9/26 19:02, Ilpo Järvinen wrote:
> On Thu, 29 Oct 2026, Bartu Alev wrote:
>
>> The TUF keyboard RGB attributes kbd_rgb_mode and kbd_rgb_state are
>> write-only, so userspace tools keep their own copy of the lighting
>> configuration and lose track of it whenever the EC changes state on its
>> own: after a firmware reset or a boot into another operating system the
>> tools show a stale configuration until the user rewrites every field.
>>
>> DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
>> snapshots the EC's host-visible keyboard state into a 16-byte buffer:
>> lighting mode, red, green and blue levels, animation speed, and the
>> four power-state flags.  The first byte is a constant 1 written by the
>> AML, which distinguishes a KBLS reply from any other object the method
>> could return.
>>
>> Add kbd_rgb_read_status() to evaluate and validate that buffer, parse
>> it through a packed struct, and convert both attributes to
>> DEVICE_ATTR_RW.  The read returns the write format with "n/a" in the
>> command position: the command word belongs to the write verb (apply
>> now or save to flash) and both verbs update the EC mirror the same
>> way, so there is no state to report there.  The three EC speed codes
>> map back to the sysfs indices 0 to 2.
>>
>> Readback was verified against the EC firmware: the status bytes mirror
>> EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
>> select animation step thresholds of 30, 20 and 10 ticks per phase,
>> which matches the slow, normal and fast labels.  Tested on a TUF
>> Gaming A15 (FA507NV).
>>
>> Suggested-by: Denis Benato <denis.benato@linux.dev>
>> Signed-off-by: Bartu Alev <bartualev@gmail.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c            | 83 +++++++++++++++++++++++++++++-
>>  include/linux/platform_data/x86/asus-wmi.h |  3 ++
>>  2 files changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index b33ebdb21aa2..054d1d684bb0 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1062,6 +1062,65 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
>>  #define TUF_KBD_RGB_SPEED_SLOW		0xe1
>>  #define TUF_KBD_RGB_SPEED_NORMAL	0xeb
>>  #define TUF_KBD_RGB_SPEED_FAST		0xf5
>> +/* TUF keyboard RGB status readback *******************************************/
>> +struct asus_wmi_kbd_rgb_status {
>> +	u8 signature;
>> +	u8 mode;
>> +	u8 red;
>> +	u8 green;
>> +	u8 blue;
>> +	u8 speed;
>> +	u8 state;
>> +	u8 unused[9];
>> +} __packed;
>> +
>> +static int kbd_rgb_read_status(struct asus_wmi_kbd_rgb_status *status)
>> +{
>> +	int err;
>> +
>> +	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
>> +					   ASUS_WMI_DEVID_TUF_RGB_READ_STATUS,
>> +					   0, (u8 *)status, sizeof(*status));
>> +	if (err)
>> +		return err < 0 ? err : -ENODEV;
> What do you (or Denis) think on sashiko's mention about 
> asus_wmi_evaluate_method_buf() casting integer.value to int which might 
> end up aliasing high-bit on return values with errnos?

Hi Ilpo,

I don't see the sashiko response neither in my mail nor in the lore,
but I think I understand the problem.

What I think is that we have been lucky.

ASUS probably chose the presence bit high enough not to cause
troubles when they have to report a status to armoury crate
and they don't use negative numbers, but yes I agree that the
return value is more to be seen as a bitfield (with some-bits
fields as numbers) rather than ints.

I have actually spotted this on a commit from Marco that was not
being sent on the lkml (because he touched that code) and I didn't
like what I saw (I didn't like what was already there).

Those commits were about modernizing the use of mutex
and __free where appropriate and I kinda liked them, will
ask him to revive it...

But proper and coherent error handling will touch basically
a large part of supported hardware and asus-wmi core
parts,

I am a bit hesitant to touch that code because I might break
some old and not widely known device: it's the only reason
I haven't (yet) acted in this regard.

> The other caller seems to also return that value directly out of _store 
> function().

The other caller got lucky exactly as the rest of driver.

setters in wmi don't even report the presence bit so there
is even less "incentive" to actually check it.


