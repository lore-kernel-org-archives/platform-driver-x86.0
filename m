Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8427874F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923141; cv=none; b=ZAqwd/l/J0rWTOmsCKe767Yw5FR9uV0Mq0esBQcLpLknHT6GmUEHTWgjzxtOK5sQDtpMl49CssL0yLxT7mab1+zy5TBtGYXzmwvp2pASdk3ZlcCZc5EMIkyMC4X1Uwt6H04U5iYNI4sM7IT6wQbYodxAG68Fm1XVhQwjsAjYhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923141; c=relaxed/simple;
	bh=1jivHIImqDblS0RZVQ945KsTLSsn4Qtb45kJdvRw/uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKObjfknbWYNBfK8B2wQxPxkWYEDt5XHxYFZ5I6+Yn8OOUyKFCxNXgXchiR4iutvqKsfOugMwysSrLNEOL92eDPr0kmaH+7WyYIFWjB1xxeC/Z5/Dw+mIngOzUZaC8pZZzFpwwNsmsHNOuto94BW8puSB0qRWejZozWjZemonh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZ3UvmrR; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZ3UvmrR"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-915767ea2d0so324766485a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780923139; x=1781527939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jivHIImqDblS0RZVQ945KsTLSsn4Qtb45kJdvRw/uo=;
        b=PZ3UvmrR5IcWJG7i3M4D9gt1RI+cFVx0mXyrJA6E6YmWLsNE++jEGAJrFrBB+SkHKJ
         dztLgRqvDukl3CfcZ88elwFerHO2wbejHDxOAaWMNHxutBIfOc/6hlIKnbJ8dWBlfoCw
         RWb3KUCOy1OnCHfDKOSpKB8Jxj8sgKCbbZvWKkTouyxaoaHobUpwnjnKGuzSQM3Sggar
         XXbsncMiKW411eCheM3mwPQfk0FTtHAI3J1nyYVyLL2mCeeKgN08TnQAO/nbk3jVyqKd
         i7eWzPC/HoE8QBXG4e3pLNE6iDrA4fqKuJFMMs2zOZ/zT4bF1/4g/FHYHf2p6z0BvFmR
         D/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923139; x=1781527939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1jivHIImqDblS0RZVQ945KsTLSsn4Qtb45kJdvRw/uo=;
        b=oBLsAb2L1i5QcdCVaNXoDO4w7nBPUAooMO5OIumDgq1Ejoq+GTZB2ee2321dVLFYj2
         d7zshCVnA4gtI7AI5e3TFt+wKCNCLokcFSp2XXX4NysP6smuvWOS16qsmgrMJlNCqyjI
         Qaz7B8ya6nMhOD5MONhVDVTXsGL5MUUrYkVtjs0Z/+g89R/KUxFDZ0iIhweyFyv4H4+n
         rJ+wHYDn0U3DBDvbJ9XxRpkkC7th5UIQmwahl5sbmsHc5pJCvKuHrBqQnuYYLN8MB6SX
         eSNbWnCcldRj4jX7Dc1Rzea451htlJGSDhr7tj9WvSJ2mDRBxjfR55e+ZuMKLD8wMS3/
         +T/w==
X-Gm-Message-State: AOJu0YxqawYCq/bPrhEy3wDNHHbC4WQDs2Jdy0UUKMTlruiIR12goWMk
	T3j2zHbAxMPrkeJ/aYLc9wKRWnoZGMm72o9IqF6tZUg7aYtP1NQsGsAbKhHW0l5s
X-Gm-Gg: Acq92OGPIGRJtVm7C+5L2ijdwKP7cK2BZk5TJ9b4mJJCO9UD3hH93PJyGGLkG9SIW2c
	9+H5Sq97MAFMve2gPOJIs1e0tKghVHFouWKKE/i451OsRpry5kh41LDXMPfO24xb9EPNZspXt6c
	iXqFNFStsD5zcJbou4Lwqav/jXtJPEsMIldoSduOtchG0wCopSlVoenAK+aCa1Dr+WItt1Xvesa
	D5bv7qWDbfBTgJLT/rxbR6Dd2K7cUs0gyXmX2+uru6OyWQMImZlbnilwokQBjzK2pCNeY/B7SaQ
	5TS4wj93oCD6BVzFg/iROvIecLTPsa1TxmyQcZky/YI/U7vBmR7Rpcf3d0lqNpdTU5JMYp+Hg3e
	Sa9uEWiZQxdmVru5lxC+FgGLShUiS/BQRdfaQ55Q1oA1dTIT/U0BpVwufHfKZeJbJKX6UZZscUZ
	e0pBZv8Nahl+6N1Sd7fyHwZq5sPIUK0nDjKVpd61VmanXXMZQ4er2MdrcRjh4X9bO0kw+cmWaMV
	JiBvgo=
X-Received: by 2002:a05:620a:a197:20b0:915:aad5:e945 with SMTP id af79cd13be357-915aad5e9b3mr1621801585a.21.1780923138541;
        Mon, 08 Jun 2026 05:52:18 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a381febsm1698475285a.23.2026.06.08.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:52:17 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: platform-driver-x86@vger.kernel.org,
	pithenrich2d@googlemail.com,
	mpearson-lenovo@squebb.ca,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: Re: [PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Mon,  8 Jun 2026 08:52:11 -0400
Message-ID: <20260608125211.11957-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com>
References: <20260521144034.282419-1-carvsdriver@gmail.com> <20260527122701.242907-1-carvsdriver@gmail.com> <78833ba9-7ea0-4c7f-8d41-ac0fd64ba15c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08-Jun-26 11:13, Hans de Goede wrote:
> Dave, I see that your "[PATCH v5] platform/x86/lenovo: Add Yoga Book 9 keyboard
> dock detection driver" patch also uses a DMI match, is that necessary ?
>
> If we need the DMI match because the GUID is not unique enough, then we might
> just as well add this functionality here as this patch is doing ...

Yes, the DMI match is necessary, specifically for the block GUID
(E7F300FA, LENOVO_FEATURE_STATUS_DATA). This is a generic Lenovo feature
query interface that may appear on other Lenovo machines for unrelated
purposes. Both GUIDs live under a PNP0C14 device with _UID "GMZN" on
this machine, which is firmware-specific, but the WMI core matches by
GUID alone — not by parent device UID. Without the DMI guard the block
driver could bind on unrelated hardware and misinterpret WQAF's return
value as a BKBD field.

The event GUID (806BD2A2, LENOVO_BTKBD_EVENT) is named specifically for
Bluetooth keyboard events in the BMOF and is likely unique to BT keyboard
dock hardware, but keeping the DMI guard on both drivers is the safe choice
given we can't easily verify all Lenovo platforms.

> I do wonder since this seems to emit TP_HKEY_EV_TABLET_CHANGED thinkpad_acpi
> events if the existing thinkpad_acpi support does not already provide working
> SW_TABLET_MODE input ?
>
> If it does then also having the WMI driver emit SW_TABLET_MODE events seems
> to be undesirable duplicate functionality.

Tested: no overlap. On the YB9 the existing SW_TABLET_MODE source is
lenovo-ymc (not thinkpad_acpi). The YMC driver tracks hinge/orientation
modes (clamshell=0, tent/tablet/stand=1) — it does not track BT keyboard
attachment state. I ran evtest on both the lenovo-ymc and yb9-kbdock input
devices while detaching and reattaching the keyboard: lenovo-ymc did not
fire at all; only yb9-kbdock emitted SW_TABLET_MODE events. There is no
duplicate functionality.

Regards,
Dave
