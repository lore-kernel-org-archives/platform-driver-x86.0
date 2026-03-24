Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E653135A3B2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339592; cv=none; b=lLyoUxIh4ffySeggTt+yKWM3NdCfmpWstaR4JhzkXsEqVJ6nWuV3MMu9HVe4orz6Kp/U+ApW/KGj1pkxeLU1+pfoNsotIc31vBnu6Pg/3Gdp6hdgCxH1TUSR8V/ZNqGPXeq+dNajt03dq+mi+YR5xz4DOQdvuPYMOQnWLYtyAIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339592; c=relaxed/simple;
	bh=EnjoSDfLwT7gPuPdKxN3TE+trLx0l3Kn6kafF81k/8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9rhjlIiGOKSX6f2lbK2YAJ3CA3chtmHxqafaFNUPJMU8PRm3D1ar1oeKdO/NqfU+HKzTI9z33YINNWMCXdV9EzuKLhF2fAchspKEZKk27CgF6kPNjcwtmZt5WLtUDaCzRW3i8cjYnwfA1N7h7T5IYDIrq4EtmvVtRw3L8qlgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBcb53NO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBcb53NO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so2097512a91.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339582; x=1774944382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnjoSDfLwT7gPuPdKxN3TE+trLx0l3Kn6kafF81k/8Y=;
        b=QBcb53NOFTxkMSY4fT2Tkz3WtSaZ+BWB/lzM8T1q2WNsh1Lv+WWofHqza0WicHYm75
         JxSh0nrkBOkcTwyN/ESDUqPqbuTFTFYkEKSEQGFnwJS5a4PYC7rsMQ57g3Bua/o54Bq4
         dB2haxcR/lDJ0+LTuciFB/9FjTt/fOgnYF8M+ARsuf/RJZsz2RoAqKL27EWF8sU4y5Oc
         uUtkZiKcQ8/Oa2bVWLKiU1f/LcCSAP28CAaE0JcV6/C+81g1rNM9ARFQB5gOUd79WAWx
         AMXrKXTa7fJAD8DGjCW8RyaTHMVnLXIbqSUKpfCdyJkGMHVNerq+R9y63vxXtCwrnN6I
         1p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339582; x=1774944382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnjoSDfLwT7gPuPdKxN3TE+trLx0l3Kn6kafF81k/8Y=;
        b=jK/0Shl3tHFZ6f8/P2ekdcEAmnEQHw+YB1ReT6AppZBbErD6eLVyYfdUpHmvDfwOzu
         E1ieQHnv52zdczvg14BLuZSpSALwV7QGLvShOGzfh9ammCynVwa2KqCjrjCoTT8JwD8w
         J5YRk1o6Wql3pVoBZfYikRdEAkaLh9HGrPCP0aZXnbw2EQsz+ma1uc81Kdq2AKk/UYDj
         P7qEQgcT7nxvI10prc2Zyn/TfNcaialkTFse4Q1j3MlRHPAlqYmoWmMVFwKDj1INO7zK
         4bYwUJfAKACeC7HvOZB+UL0mLWbS9koMHy0YLGnG1JtAqJl4ookKPeoqd9/hnqx39xtD
         46iw==
X-Forwarded-Encrypted: i=1; AJvYcCU1w4R2EocqgWtJS/UEgIDo5DQc3acPAFVJcx4aq+ciT6G2/kQkeEO7qORE+O25UrwVrPIdKgmD6lHfgHVVaZajO1TR@vger.kernel.org
X-Gm-Message-State: AOJu0YzatWPhlHnQB7sDdsbLWTejWVBzkWMVg7hvlKxXxdyr5HXgEtRY
	VZ2ja0Fe7RSp17k3Z2BGVWNSZkxyLkQuKuvpwc535g+DeWQlxEtGICPB
X-Gm-Gg: ATEYQzwQRZU1t/eZWr/2Z9Lgf8WaBRpCfdNDiE2nBH6UJcc6I3VdPpyTpiCcS5L10xj
	qvebM7DlX03Gbt51t01hjSh1SJbNROCurd/c3ODZs+APbz37ceNb+7RwdnVSJLYqBTVf6fHiT8w
	kdbik3nCSZmHvnto43B2SyYBRl4areBBXOTDL7UVprqcQz7erLkP6/z04ts7OQUTkxo9085gOM7
	iLkzee3L7yiwbC3E+uFqSsbMLee6cBnZOJwlri3ge+SfN659BakMeeZ4+pklWnMYYo9Bxz587lv
	OD1G949p/brjezNg03rE8LzwxSI5YcIJ47NBZyLBZWYAyHutoKn6OlB5jHNOmmQwWqtFiqzTlJx
	5zGL5JsXY4JfyTTgXOc3ohlm0Z7w11HFTW4i4o+L3ZHx/wFy60Ptumm+JoAdWqOJ1+Y2C5giXFn
	9GU0kCGHq0hu98FXyuLPs=
X-Received: by 2002:a17:90a:1c02:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35be51b1947mr4748349a91.17.1774339581783;
        Tue, 24 Mar 2026 01:06:21 -0700 (PDT)
Received: from gb5 ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03165c5esm1495091a91.14.2026.03.24.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:06:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 13:36:14 +0000
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: ayaanmirza788@gmail.com, josh@joshuagrisham.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: samsung-galaxybook: Handle ACPI hotkey
 notifications
Message-ID: <acKSyeHQT4GS8pp2@gb5>
References: <44912fc0-91fb-0a85-64fa-1b0b3661f0d8@linux.intel.com>
 <20260318054242.24747-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318054242.24747-1-ayaanmirzabaig85@gmail.com>

On Wed, Mar 18, 2026 at 05:42:42AM +0000, Ayaan Mirza Baig wrote:
> On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
> mute, and camera block hotkeys do not generate i8042 scancodes.
> Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
> respectively, all of which previously fell through to the deafult
> "unknown" warning in galaxybook_acpi_notify().

Hi Ilpo,

Just following up on this patch - I wanted to check if you had any
feedback on v2 or if there's anything I should revise further.

Happy to send a v3 if needed.

Thanks,
Ayaan
