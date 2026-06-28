Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B23B1B3
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782624047; cv=none; b=agYfLE5l+ndHHwBxLWJbTNLma7ToaSUsBIG8C5INpPwy9ODuhnILZaJfR5lOjmXvKYrx5feveu8B2DaF6ajSrnupllnfVwSgZFnWgKBevm70Vjb9DIAAv1V0LKsUboL5DIGO/O3jsZOAsRLjwmhOshD+B2BHb5qdvLcxmek0SB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782624047; c=relaxed/simple;
	bh=MLaYhnN7KOtuKG04ENMJF2v9RfKN7E6wkedBenIMc3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBDDJ+bGFdZ2rjfDjyVa29AdCkM+D2Ym5RwhhUEu7Dl4b0zJmOTdiG7j8LcYmlkls7LYzLysvFdWZK0lWHVBGmXotQyVgt4nsRR+1Bv4Ecl+rgF727HHOE9WMYJhqNyxlRuc5KPlPNUjyb2rjcaJvuQSlTwrLahexSxQGKvXX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwFw1k7n; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwFw1k7n"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30ca1b4b278so4153063eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 22:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782624045; x=1783228845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsuB9Ot5i9D/y4JdzCOZ814oCSLvwQDMPA3dyJ8qenQ=;
        b=GwFw1k7nVm9IsOmjM7e/DT1CQcB4uq20qEzyQTiDvLT/NBESBokxO5y5QEEtTyUZwJ
         avLMrxemsoRCHvfT1nldgSiH8dkkgdF9dIcQbynPi/deqvQvcG1IFCUA8m7mnR8RpCvL
         Nn+uMTfVL/kVuTy2OpzTqY3Fguh3QFy5NIIJe54F1VOoOJs0upigJszjHkPKuYAMC5Sd
         t1RkgxiATNtGFseJ+DRiqTo4v2KTS1mRPmbGlM8s/niLl8mMA4z5KZuuZ7ReO+jC61bT
         3xQExAdtFJGzYU7DXXTal2c/36AxjDgzWIa9LxC50niejB27D6D+2Z+AqFTsAhtAVAgw
         3fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782624045; x=1783228845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsuB9Ot5i9D/y4JdzCOZ814oCSLvwQDMPA3dyJ8qenQ=;
        b=siRL2GTry/cbdLCRXuJ0FrBD+u4p5ijSyEMnFfBxmDNQrZkdo25QtO2GDYFzDRPvZF
         lVrwppOmxiMZVu65G+hO2Xc+wlBRlUPe1zA6QzzvMSfOsmtbEITc7ZOH5eZJFUAOkKvO
         gqas1qlGVa4SC6Bbdvh1bnLcVHLDBftpAoi5kXVwgFJG1KUN60uJ4qY+qccut15UKj72
         g8nVQ21vSNt+GzzqliC5v8wko1Yj/GH1C9URLI7IOZOlscwoKqDs5FEHH4d2CTa0Nb9R
         MSW/hxE77jQeDBBjx4QZbAiJvA4nVWTOIwz1OuS/0MSMi45Ct8aeoP+5jNa2OCrq8tLu
         ziCg==
X-Forwarded-Encrypted: i=1; AHgh+RpVsHqmkbwfl5GRSWZk0xYK5P4dDIs7+Ipo0SVAbgxSBdsFpZE/M1bG7L1q127JkfEyTu5YJGVTYMTJaUKEyNwBd9Ou@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kegm+O8pyroNOfasK7bpx7RH2OpebwI6Qsol89tdnxg8hheD
	g39XMm7iYOcRyQhKoW1kZXHe2lPAtkZWZjE5EiHvKE4EgCAwFvgdAuW8
X-Gm-Gg: AfdE7cneSlqAvlGTiMfMadz6ikYB94ZOfK+FjJaGlVelXnD9CNRfa6qmNjldozuBmmy
	9lPlHvawiHoZU9lUE8vuSuTSoch0DI+hDhp86CIjvZnoD4MiEooO87LMbD7+i9VyslkdQs/4SSL
	DkmC8SVQ0rYyv4TVTf6VvgZd9lkl1O8saD8jDBtsDJDtcLVIcuU6egOCZrgUR65WA1Fje2Aos6/
	MkGsiV/5kubme8E8BuOVjR79kP9Au3rl7YuCvgOdmcyt+tro2DH5nmLEH4+ejyvA6eRZu5FI8H1
	VgBTAsyoOPZzDFWrJgxGP7j/TmmfJPRlgnvzLuynys7AkXUCJF0mCE3h3df6GrRUCNJNH56IU24
	kvQuoEpDAsiMB3/wuKlqTzMkgU20cO6ak95Dqaqof3qCb4qnRKwcBJGwbar8jfbuKtL38+1zihz
	7SODLI4geR1bVwShRMfHNXryZXWPlZULzAeOm96OWYQj1YVLHLsKbyeQ==
X-Received: by 2002:a05:7300:e804:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ec1df46ecmr1279717eec.34.1782624045248;
        Sat, 27 Jun 2026 22:20:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:977e:876b:dc75:9723])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm55332843eec.15.2026.06.27.22.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:20:44 -0700 (PDT)
Date: Sat, 27 Jun 2026 22:20:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rodnei Cilto <rodnei.cilto@gmail.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] input: atkbd: add softleds quirk for broken EC PS/2
 emulation
Message-ID: <akCtwcbLCfSTKrMi@google.com>
References: <20260628-ideapad-kbd-leds-v1-0-50b421d94927@gmail.com>
 <20260628-ideapad-kbd-leds-v1-1-50b421d94927@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-ideapad-kbd-leds-v1-1-50b421d94927@gmail.com>

Hi Rodnei,

On Sun, Jun 28, 2026 at 10:57:03PM -0300, Rodnei Cilto wrote:
> Some Lenovo IdeaPad laptops (e.g. 83RR/83SR, Wildcat Lake) implement
> PS/2 keyboard emulation via the Embedded Controller (EC) but do not
> fully support the AT protocol. Specifically, sending the SETLEDS
> command (0xED) after initialization causes the EC to return corrupted
> scancodes (reported as '**' in i8042.debug), rendering the keyboard
> non-functional.

"**" do not represent corrupted scancodes, they are safety measure to
not disclose your password on accident.

Use i8042.debug=1 i8042.unmask_kbd_data=1 to unveil real data.

Thanks.

-- 
Dmitry
