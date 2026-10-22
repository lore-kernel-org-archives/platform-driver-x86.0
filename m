Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660424;
	b=y9AqjQMgaw+zvlAhX2QcdX6zTkC1h6xDePK/1N0VxO6JuaTbC1HKiyRYUsLZ+bLuKSU0
	 uE0pg8VNusaea/bfOWMIsP2O7jhI+zxdsVZEOL4BgipWBrrEgAjfTOk3yvPilzjeU18A3
	 hh0gIdneidgRYJU9j2tK1TfvV7Qz0KbRupV6iIN5e1FChPCGbIMZk1HwXbiviYLEo48p9
	 snKZsk3cHGwLTzN/Ese9L0lShLosiKvg6NTKFW3JcvMqQbyUZrucXXyNH55W/rMeuilqM
	 TK2b3kqtcRftb13eHLvtDQimMOSNF2sCDU4SzOQ8w74Pl7KhUO/I5mLHVSrBDh3+WWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
	b=FN/dBpKhFNSDF/tvCzGC2+Oid05eXumMEJ4zO2rQ17lR7Ibp0KRFwHPsSFoBDg6FCjsE
	 /FVdpLshWTCE9dVShbVBYtQUvHq5ljZ3OnjvUig99oVLYlQfNwP4PPQSlQVH+5Om18gN8
	 oICNMiWUGriFSO26sjlAHYcN6+QtHCFAJEqe5n7LfEwuLN72GCDkfi112WEmLnw2icG7O
	 +7U7mieTvabEKyoX9Oyp9POV0dgnfChqj92gYbytn5ti4BHkHejxzvaEPdFUXhgEl1gqh
	 zFS2+G3ww2GGLyB6fPc+SoLkeqoTHGt0BETA5hwbyXea3hiTscQj+b0ZXrWjCLTGY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jq6Mvjce;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F042606A319
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 09:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F042606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jq6Mvjce
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06e79e152so751375b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660423; x=1793265223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
        b=jq6Mvjce/GTIvohfeypcC8iNVJ22S0OK14YRw0GjEkO6A/JX7+xVN7J30xXe6BwcJp
         yLJMc8DFMaYsDtCq+ZuxdvgV655pgFyqvxYXowtBN9lHaBmNe7jAVIDPBkMkQf20kiOW
         wTfONtjrp57urRp+yeCmgwaG2/K1WKyXgpcwmFrpS4slGUEBeOp7fFQqTj+gRzXxi0ee
         XCnvBlbvW5Xp1J4SDYjhHt27Iwz4A8vSLhVZiSy1ZVaPTiK7hzptTdFKIQrMF0myeOA5
         V8yj2LIubUgRWyWSr87Gv/jMEyWPfJN/oLo/FmCLNE8DpaHO9Q4mngcXvNNSsfWOhx5F
         C8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660423; x=1793265223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FINTa2MpCSNE/TWHxw/1m7qkME3F6UZuCUBBZ7mFXGI=;
        b=JlaDCfj3pyHJ3gYB3ApE5GDyLD1MGgzwn2rdSFkIwyCRfpOR1xb4Ah/9U5M3mLMiSa
         dLgLYQV/uKNS36mGH/g1zddWgNoivNb40c0owALSXRjYWdzqrlKPxqCLU/T/O1xZlVZ4
         8HH3DQoLd0hSfdODIoDWL8Ejzvt8YL7irbjpbqSzDlOIXk9X2Q0wgwJayYG43QtLxrT4
         xOVbrA332UfI2ivh0o7QNw14rKeUBLqW0Sn8mbbh0x8SYkUIHigQd0ChDShgXvwGW+IJ
         9vkM/+bZNOqYM2yzxJdFcnFCy3EwtSUwzEE/6IrHqmhyqqXy2DuNVheTUOSWZhhry914
         DCtQ==
X-Gm-Message-State: AFq9FYK81XBr3cQU1rrpOCtg6FyuXxA02gSC2zQY1CD9c0rqCzvon8UJ
	xwscGZGEbuGhpgvdf3idKSGNQkOO/cxJifDbBrzrFdXAhXoFDHm1Vpzr
X-Gm-Gg: AYBFou3Fgz9diCSKb7Z5rAjfOu1fitT/rNZUsUtBzbSsgONp/UDGBUdaNvKWlEfArFN
	5ex9X+eg3G3L64JxdptSq9JzHgrsiI2L6zc1KYOHgf9ddK3UXKlnFhZegIaB1S1rI/tC4dDpoGO
	9AwUZBDqWW67+85i/X7Uvo+ITaH4qPe9sm3VjWNObNI7sv48WlzyeXqmWNH85GWi59IFp2eXArz
	Uagqhj7+6mDE2GNJiFMTQR9RwOhdUGYPVMKkkeysuB65SMDk7pmBXmCUekz9WOtA3LtqkFkCQMd
	eOYSFSzDRyzjx3YReRViyHdd7cOvqkgLnV/D0xZZQ72HseWsjbWm7ulDajnvbP2Cx7gZ532mO+Q
	HKR04ytMnbbVu9vhwVYq+OPD8uZ8xJSORS5u7VUbbXPgBDS2yYlwHwkzUfM3Lge3Wk0kNNUFvDu
	ThGfGc9wuMOIxW34E2lao/JtH9BJVpTohsAbNzDmrJ+KiRQVYh/aBa5jDdUEAPJRpF0hJ2oWpYW
	iuQnhnzsNiucMavnpYKYtEUpaUhHXypnBvy8cNEPQsjFWJEvk+hOvKgfgt9+LDxXDTvh/Z7B+q4
	/NB/jzBUsR5GFWWQ96A=
X-Received: by 2002:a05:6a21:9d8a:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e287f30989mr3468912637.72.1792660423266;
        Thu, 22 Oct 2026 02:13:43 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:7b5d:9435:af71:375d? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c060asm1855223b3a.22.2026.10.22.02.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:13:42 -0700 (PDT)
Message-ID: <271a9f64-e1d8-4b21-968f-9cb95b980ec1@gmail.com>
Date: Thu, 22 Oct 2026 17:13:38 +0800
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Serhiy Shliapuhin <shlyapugin@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
 <bacdb44f-a4ab-4d55-a312-5648515f41ac@leemhuis.info>
 <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CADGd8gF9DxnDVZxbsARCNkXXp7_aWfWOkyAN_Y8v65TtKW3zNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/22/26 16:08, Serhiy Shliapuhin wrote:
>> Can you avoid it by blacklisting bitland-mifs-wmi?
> Yes. With bitland-mifs-wmi blacklisted no platform_profile handler is
> registered, and power-profiles-daemon switches all three profiles via
> intel_pstate EPP again, same as before the driver was added.
>
> The same can be achieved by running power-profiles-daemon
> with --block-driver=platform_profile, which is what I use now.
>
>> And does it still happen with vanilla 7.3? 7.0 is long EOL upstream
>> (and 7.2 soon, too).
> Yes, it is reproducible with vanilla 7.3-rc3 (Ubuntu mainline build,
> no distro patches; newer mainline builds are not available yet -
> bitland-mifs-wmi.c has not changed since 2026-07-03 anyway).
>
>    $ uname -r
>    7.3.0-070300rc3-generic
>    $ cat /sys/class/platform-profile/platform-profile-0/name
>    bitland-mifs-wmi
>
>    low-power             -> accepted, reads back "balanced"
>    balanced-performance  -> -EOPNOTSUPP, stays "balanced"
>    performance           -> -EOPNOTSUPP, stays "balanced"
>
> Understood regarding 7.0; I only mentioned it as the last kernel
> where profile switching worked on this machine, before
> bitland-mifs-wmi was added.
>
> Thanks,
> Serhiy Shliapuhin
>
> On Wed, Oct 21, 2026 at 5:56 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>> On 10/20/26 07:12, Serhiy Shliapuhin wrote:
>>> On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
>>> by bitland-mifs-wmi can actually be selected. "performance" and
>>> "balanced-performance" are always rejected with -EOPNOTSUPP, even
>>> while the laptop is charging, and "low-power" is accepted but has no
>>> effect. As a result power-profiles-daemon can only stay in Balanced.
>>>
>>> This is a regression. With Ubuntu kernel 7.0.0-38-generic [...]
>> Can you avoid it by blacklisting bitland-mifs-wmi? And does it still
>> happen with vanilla 7.3? 7.0 is long EOL upstream (and 7.2 soon, too).
>>
>> Ciao, Thorsten
>>
Hi, We're tracking this issue in the recent patch series.

https://lore.kernel.org/platform-driver-x86/20261021123414.25516-1-qby140326@gmail.com/T/#t

