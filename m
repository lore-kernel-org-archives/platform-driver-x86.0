Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793539608;
	b=uGZfgk6dAcYsmP5vybZbtxbsivAuyDzWaQbdCbV8nn3JAwxY5JAip3s0b+wMPReR1jLj
	 3Smv2JPOS0UbYz08QKoifRoqn7J9gs3zhDHWCQMa4BESCVLdI0/OMQuW+FKh+RCrWF2oS
	 w4F1D47jbxtmlYWhDlIw0am99wScL+GCrqpPohIFrWOqsKU5CN3aaugzeme0oa7TktR/Q
	 dXZIzMdiLZwZlmskiWYVDuWkqA9gbFt5X/Z2FISgXxZ/Bbl7mTvcbuetlbK+J7a26vXGz
	 xAri0TBoRs5Pt3TuBYV8P6Q1mwC7WQkpZEzgALU4TTgYLoHcZrA8/aCkiogXFWCqf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793539608;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aKyBuQr13RLiolUgRmB5VAKR1a79bas7tQ4a/KPgI7c=;
	b=KfmQTzFHutG3ziJnkHNWcuyd5QTntnRqqDjdkoaSp9uIHtKWcAKPM48ZrUHJTzCrxaFw
	 NzKY/SGqGryvXz9fblk1iCxDWGTslG2UX1dQR3EHBdZmnKPyU7ieNUmMPi26kMpDCI+JC
	 +WFdNZRagkFKdeQM4tKmOpBO6p1I6ez4tCeNOnqCIlnaBw0DrjPy61o7ksU86V2JvBuZ+
	 dAsqh8DygJRaDj4nTs//oxo+xCyHkqwVmoVh8Os+lZu3SH5TwYHjHVge3GUQ1LgAihc0i
	 9K7aLHJv9DCHekQPR4m023wpq2FMRao0XvNLWlD4EF+oys21udn3bM2e8fjXkmBC4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.141
Received: from mta1.migadu.com (out-141.mta1.migadu.com [95.215.58.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED3606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 13:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17ED3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VgnvV8KYewLQh7o30456jGqrwJcpByvVJ52DrspwXhE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793539604; v=1; x=1794144404;
 b=F5ytmZIDcVdSZ1baFEOg1OP0ayc39nHfYG/cnp6a/k+TTEiLlE3C637ArK9dYUkNHb9eQt20
 DpDXms50ht6OUEK2tO6OowV1HG6Ykfj+ICvdCvZH4P57nKwXkc/Bu6hfs3B9HNWOzjdkjX44Oj3
 SmAWqv+6BpxkaTlilhD1ECEE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8337c68d1880b191;
	Sun, 01 Nov 2026 13:26:43 +0000
X-Mizu-Trace-ID: 8337c68d1880b191
X-Migadu-Flow: FLOW_OUT
Message-ID: <7e1e2095-9ab9-4ccd-8ab0-5e89260ddb8a@linux.dev>
Date: Sun, 1 Nov 2026 14:26:42 +0100
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
Subject: Re: [PATCH v12 01/17] HID: asus: size feature reports from the HID
 report descriptor
To: =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 kernel@lists.opengamingcollective.org,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schwartz <matthew.schwartz@linux.dev>,
 Denis Benato <benato.denis96@gmail.com>, Jonathan LoBue
 <jlobue10@gmail.com>, Khamunetri Clark <khamunetriclark@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 Nathan Chancellor <nathan@kernel.org>, Ivan Levchenko <me@livan.pro>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261031174130.208240-2-denis.benato@linux.dev>
 <20261031182956.2250899-1-rebecca.mara@posteo.de>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261031182956.2250899-1-rebecca.mara@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/31/26 19:30, Rebecca Mara Müller wrote:
> Hi Denis,
>
> as asked in the cover letter, I repeated the Zenbook Duo test on v12.
> Everything that worked with v11 still works.
>
> Setup as for v11: hid.git for-next (hid-asus.c f6aa1be09ad5), your
> v12 01-12, then Paolo's v4 1-4 and 6-7, leaving out 5/7, which this
> patch replaces. Your patches applied cleanly, and Paolo's went on top
> of the reworked 01/17 without conflicts (4/7 with the same trivial
> fixup as last time). Built out-of-tree with W=1 against a 7.2.6-based
> distribution kernel, no warnings from hid-asus.c. UX8407AA, my
> userspace workaround stopped.
>
> - Docked (USB, 0b05:1cd7), captured with usbmon while reloading the
>   module and pressing the backlight key: 5 SET and 2 GET, every one of
>   them report 0x5a on interface 4 with wLength 16, all completed with
>   status 0. It is the same sequence as with v11: the handshake and its
>   read-back, the 0x05 function query and its GET, the initial
>   brightness and two changes. The backlight key and Fn+F (platform
>   profile) work.
> - Bluetooth (0b05:1cd8): the backlight key and Fn+F work, no errors
>   in the log.
> - After docking again: the backlight key and Fn+F still work.
>
> Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
>
> One small thing I noticed while applying: 06/17 adds 14 lines that
> contain only a single space, and git am warns about trailing
> whitespace. checkpatch will probably flag them too.
Hi Rebecca,

Thank you! This time for v13 I have included your tested-by in 01/17.

I thought I fixed those but apparently not... They are gone now,
thanks for warning me!

Thanks again,
Denis

> Thanks,
> Rebecca
