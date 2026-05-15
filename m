Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B6926C385
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778820412; cv=none; b=emYChai2u8i9uTkY+1sl2EOpkIq7TQcZ1tLGr9ex+/Ht/BN3NjGlIH1EKrubvB6GXAxhlroS1ekC6tQjz66l36fmySBZUzRazAChhookBrd3g9471m7beH+ccTrOOkW3OSa9QQwUct9B+ZdmO+sbqda2cueXDiiZljjsCer7jCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778820412; c=relaxed/simple;
	bh=DebnKZBP3fkff/DtEEsvGg42PDXBlj9dtaWP19buPrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCoJcIoXYAKrMcreFR41wZS/aNIWVPCFdGyGGT3gZHwYqGbPT7MHvpRbOvQ0agj7buha5/ORR+fqno5Fwx4mQlmLRZdvPrwJpDSkCGRZaOEVDlKsahGW8Vb/BBoWT3awTt/OWqd7NWkrc3ehjWOe9ZVlfrMroLKN1janBofPdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0BKrxp7; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0BKrxp7"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3764220a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778820410; x=1779425210; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DebnKZBP3fkff/DtEEsvGg42PDXBlj9dtaWP19buPrQ=;
        b=W0BKrxp73WlwKXtCElsfEu+e7mcwrL3H0LqSUiIlcfl4olX4SMmG1IOYGmowaPoilc
         baXJv9XGSnXja7ct/pLrp2mQAY4kJv2NBEEpDYNl61rHEmFAx0yXgLgWvxc+85bZPz0Y
         4QZFIzPam4O1fqD4ZrATFCFhNfZ5EKLx/KecS817SUjDJjJSraWe4LWgpCR8e2H+h70M
         NPqgx8GRZRoxhql04L94Row0sJSdP1bPAe2du7+UHRa7IWBIRLBCDnQgSVqHR8vE1z0q
         YI7zKvuLx/GHgMKndY5LJ3QUZ33b23/zrxYtNWcp+V9/+bw0zRDl/VfZXB3GyDtuDEDH
         rlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820410; x=1779425210;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DebnKZBP3fkff/DtEEsvGg42PDXBlj9dtaWP19buPrQ=;
        b=Jj7ErGSuihYCeLIuAauoShjAIWMaFeFQYtJK81qawwLKM8pXELL4aoijFSYWZX8wLb
         VYJSqlaoUfVtR5Eyjqqy9vRJIpz+MoaJhrVcWytrL6W+3Q6lwsFfuf/KpH+PkPp6/Lo6
         iXDRCAtypm/AYb7dK+7cqsmdSDtICOyzkvyHWk3M3I0L7K4EUpP+paY1m8XWvYEOxT2J
         q6Prn0my8aSsU/e7HYFtCLLYxmy13PMJ1W19oT5KPTSVGYIGZziYAM7G/vOuUUtilQDP
         2glFZeuKGPsa29equGjYyORBedSpFXxtBo34Iz6Dj31xNuXIKuSWeputBh5D7F5UtE2E
         u6wA==
X-Forwarded-Encrypted: i=1; AFNElJ92XgPIrA7iKSduHsAG4la47zeygznch1q3kdRg7ZnNdIpotSXgj+k8YbuYg4Z5s5xHv/sNtL2XD4dyjlXIHEAB0vHo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Pl4IE51Wtk7gCfi94Yq3JzwuOjuPDspNm/AR4GhboSS3okTI
	gKshqNiqif834T14NX+M5cwTuKPVFA+b6EgZ7+UvdJQP8vsM5vwyqy8J3Z3O17qO
X-Gm-Gg: Acq92OGXDz1fjqKpIzix5BBs0MRtUSWKbVCAezCQd864MXgzBVAqk28v5LS0uG9ciUO
	Gm8BqzLrQGkuTvU3MjPhv/3jBMpglU6abuXEE2vhsqJt8gbcRufOeqTs4HtqXwcPKVhM4g5rf2f
	9lrM4W3F0AGiIyjIF8SuaKZWGW4a/Uh08Wf1B3Cxkvz7T+OauXaiXD5vtpj8k8KpFBitQOAhQnr
	mZ8vSeqgBnsl6L/4QiK0YCjtIWpLZlXArAD8YtyWi0XKQIZMN18iND33jzU4rGyLCUbE8jEZ00r
	0/lIDaAPxyo5xvpBqYuhciWdekyusxRmhBuNmaR8zXDxwo47+gspdrktDXzFcnj15O6wreO352h
	TxjEiTz0KNp4sU2NImj1G0BWvwPXXcRWd2orkl+FHAI5xdsEO8tNlRS2v7R4exSUjOP3dWnVBHU
	tdBBSUEBCxhUHmybou7rfunmjhcJoUV7m3fVU3OpXjf3Ihlp7ebNW75DAJa6yHhhe2qypHIjD/m
	balhATJ49G7Qfv8vHm3
X-Received: by 2002:a05:6300:218e:b0:398:9662:10ff with SMTP id adf61e73a8af0-3b22e6685e2mr2801258637.4.1778820410478;
        Thu, 14 May 2026 21:46:50 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb102415sm3991830a12.19.2026.05.14.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:46:50 -0700 (PDT)
Date: Fri, 15 May 2026 10:16:40 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: stable@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, aros@gmx.com, 
	platform-driver-x86@vger.kernel.org
Subject: Please backport e8c597368b85 (platform/x86: hp-wmi: Ignore backlight
 and FnLock events) to 7.0.y and LTS
Message-ID: <agaiW9AmqFwsT7pZ@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hi all,

I would like to request a backport of commit e8c597368b85 [1] to Linux
7.0.y, and LTS versions.

On new HP OmniBook 7 (Panther Lake) hardware, the keyboard backlight
and FnLock keys are handled by firmware but still trigger WMI events.
This results in "Unknown key code" warnings spamming dmesg [2].

The mainline commit e8c597368b85 ("platform/x86: hp-wmi: Ignore backlight
and FnLock events") silences these warnings by adding the key codes to
the keymap with KE_IGNORE.

The patch was merged in v7.1-rc1 but missed the stable tag during
initial submission.

Thanks

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8c597368b8500a824c639bfb5ed0044068c6870
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=221181
