Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940564;
	b=NNBFULZYD++QT+sHF3snbCldMuYkUGcucC06rac9KlwQSpvfoOYiIGHSVxAJ1CRMWdIa
	 NfdguHGNW0sST2nxcy8Q0YO9Secr5tuYbwuv9FLqJ3L6h5kzmyNPfecqfFZwA2X/vT78n
	 s2ncC6avjNc9WE88UaQ5C/RR+cnpxm3l1sU+x07esitFJIeMNJp5Ah9L01HK7sfbYlNaR
	 OoiDQOLLEh8pdOgdSFNIo2wXdnacKIfp1IFbPEDH955MziIXQK5+R+WZO3BbhDYtLqq6M
	 KO9VXoiiBnMXzHENbXGWfyFJTm8w+UV4HEKSYbgsxVB/OzYFog+w/iJiDovRcl0DpcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
	b=IrYYXfZuxEIWuAMMBS43xRzYphxR7NhS8CdzojbXNG+5jCyzVFvMOIQKkUWACv70QlYj
	 pTN20CKLStjzzUB/31QfpT9NNpAeI3lQ9tS5qB3vG0VL0BpZl/Wr2dKTeo/AE2xlRAHrm
	 B0oFrN1c7B9KQxM2EGFBQM6TS7jiH5MzVusw7T09wvn6IbJ6Fos4CPg7JLbFWYJp/+Hhz
	 klZ76uBagbZoe5r0NTUMY/TRPpRbxDC0JOtXtvswqz6enXTISP1Lt+poCZhzsZe/pImTh
	 fseznu5acFJN3URohkhe1XR1NPhzZhPYQDPeh+KL0LZR+NJP5ZQSoUXG0UtOB2a2YzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NY7Dxxv6;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A31606A32F
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A31606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NY7Dxxv6
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so124313c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794940563; x=1795545363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
        b=NY7Dxxv6aQyYfqSCSaWjfqzlhJ/a0bl+46/lxBlI2EQayiWmonn8eCPcSEZESRGl0F
         O5M4p500Fwjpz7EkNJxewnz1RFnmp2RNQ6T6l3lGogC/6kpQz/SrhY1etzeEU7KoM8VW
         TncEYyGUqKYYcl/u7ZaJkylK4s+Nt4kHmmvGgb6Nra/zO5O2y70qeP3K4xK2/Kt9cKo9
         Bi0FGRThL5Anv71ugGpHxJ0kxJFN5dGESl0yy0qgweB88IJmtB7O992TmZlIxiCvp3GS
         uZ1VgIfPe3oU1M9MuZxrdUZAsf5vEmCymebCYp6MKnqLQVDQNIkJ7vlM3HZF34F7+9b1
         BSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940563; x=1795545363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
        b=MCtQ8IUgFMk5G3pll1IhwyRPZIxcVrnCe8t82CGaFQsj8CqRQTy/dGRxUqvcCRRdDz
         TUbQTM36oMcBFUjbWgu3L9KrxnmDGMfldVGf52lLsurCKRnz5DFxc56iYF1CDzmM0WpN
         jRwCVkCWfnP4w+YxpB/W/jSvN89MwZdAPWkBdc0cg1nXkxrivcy0pVyERr7pWDmzcVpO
         Bs6WxIG4jKebWJwCj3Gw/9mOxtriYVT1Zd53Jkas7eu93anNiE8SEmC1qz6nVx+ASTmB
         4pXm4gEW3/01dO6QWOGK2lKtLN3yGgx4agycIJ3TvhoZj5OZzJROfEPylnSpL7esyqAl
         Pvhw==
X-Forwarded-Encrypted: i=1; AL+hErGHOw2mIcm7vSfVHUGkL9nwxd5S/emjCwuW7TDdVbZFt+bqtSGaCEqPu5ExlTU+Hh80rMNuC8SupBCrVH+m2YjBYHEG@vger.kernel.org
X-Gm-Message-State: APuU4Z80cNxcUFL9gCI154XPOgpPPLHdvH1w5dVS3LId+AJe5Jsv4b7s
	WOwiPkUtK/0mwjOk7P0zE+FMqZ/PX05VWn59nsLE3qlP5Erc4WL1N78=
X-Gm-Gg: AYBFou0auo/s1uAuFPSx+Jtr97M3YSCqAnWScyQiDncJw0TWxpOTzsiAFzs3rs6xSGn
	HKfW4SudeCSsAekTiLngq5FIGzWN5o+6kjNO5zojklmrj/otJf7Eq/xU43IPTgmM7cAb44zDmf+
	tuOlWJ4PuiZbIfHD1lpmwmDATJ3JW4cS8+CE7S9/BHPJlocXTDvzynvZe4PFuRsqC/xl4pRgnkX
	lhzuQ6v1cI6ZEyLNcRqjNmSBZgZYi/lXkx2ex/MO9D4hF7SnIkd/E3+XDFfONZJSQ0+jkL5aAMe
	KNtg3Z1rB8QX3+KP14zTV3sXUOVF+mgXNqj+qX4g7DDiK5q2DiWPmD1MH8lQTTvSf0TFbBnwSXp
	yI1hVmjgazlMVD0in+pehJ6LCTbpJjp5ECZRvTjTjCVei2i9MIQLkWvxo9IIS368G0131FshJyx
	voo2u77AcCxTvsDaxO13wpw8j/eZPJCSDeV6A49z0Dfpfb5YqJ9smpasPF16PBzvkVa9csYKglU
	LowsYfEegr143DEyeRe9dxxXU6SMAWpitfbtnvnveP7rWEJ79iiZw4V+LsvZCQou3CFm4+O4dSV
	4OD0Re3b54HkOlankXaUm54mlZ1tln/G2dN8FTzhMmmswzyXaT1AbIXbr9CGXtM=
X-Received: by 2002:a05:701b:2409:b0:1b3:b833:6565 with SMTP id a92af1059eb24-1b543cd7213mr469644c88.20.1794940563273;
        Tue, 17 Nov 2026 10:36:03 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.59.94.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm10562926eec.24.2026.11.17.10.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:36:02 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: helgaas@kernel.org
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	szgit@icloud.com,
	tglx@kernel.org,
	x86@kernel.org,
	yossef.osman@proton.me
Subject: Re: [PATCH v2 02/12] PCI: Disable pcie port on specific amd devices
Date: Tue, 17 Nov 2026 13:35:46 -0500
Message-ID: <20261117183546.1214-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116202343.GA205416@bhelgaas>
References: <20261116202343.GA205416@bhelgaas>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I don't know what's going on here, but it doesn't sound like typical
> PCIe behavior.  If a device is powered off, accesses to it end with
> some kind of PCIe error that is not normally fatal.
> 
> It's basically the same thing that happens when the OS enumerates
> devices by reading the Vendor and Device IDs.  This has to work even
> if there's no device present, which is essentially the same as a
> device being powered off.
> 
> So I'm not in favor of trying to avoid some accesses to devices based
> on DMI checks.  Even if that works, it doesn't cover other paths like
> sysfs.

I agree, this is not standard behaviour, this only happens when we use
GMUX to turn off the rails (which is the thing that causes power savings).

Accessing PCIe space after GMUX has cut power to the rails will cause a
CPU CATERR.

Also i dont really have ideas, im not really familiar with PCI core.
Can you give ideas, you have please?
