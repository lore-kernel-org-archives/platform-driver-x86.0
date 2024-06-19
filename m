Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7B1BF50
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718783209; cv=none; b=qXG+UFjkKt2nivaMOnrkObQRe/4/4aujhWt+mUKQ9smXVDw6XbEdRi4ERW2qhXvYUvO6RForHpBeyjvIPTNwOna3r9atoNWzWijiT5oU3YUC89NhBd35qpuxB1J7LIlbhnffRc335cQBMNU/amRXnKLhMNE2R24ynOEeiWOC4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718783209; c=relaxed/simple;
	bh=sdzmueXlmLO046hNU3U0Ksrxc+l94h9UdgG555p4V78=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PwCRG77ujA2ftfTTmoJhg/DZThBY7LDNYQ/MRE1ipkaXARVkDc+YpHQUcZ7l4PssLcSwdA56PJVAxdOnixuc/8OYv8+PpAV+I6H4FNsXv/F2mC63JObCVbymKM5siuIvU6NNSLVuW1tZlKAQROwOkA6vsQfAeOGwohlrjd8fWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StYYSuqt; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StYYSuqt"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c508ea0cc5so2698566a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718783207; x=1719388007; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Ks8hush9iEp25JS6Wqn/kiRw/D5T+IH/xRVD5S3N0k=;
        b=StYYSuqtHvEQVsIQrMKH3dlqbe0lO1C+3hvq9lHqRKNuw7qgwK4S96FlANZRXLaX9F
         oDZeFES0Pa7MdOwvymx+RzzOsZtI8ISF/6jnmmJ1hAzJrXx03y+XzUx8mWvmsIsYhF1c
         gfvk3kxYnYaQJMIVr+Nr48MpXtrPkavApYyH3KxbFsrFp6oMpMhQKwagiTBowmp1gWqa
         0OF+RWlt1TVVUiCz98N1iycJT/YnpQHgPXsdvizixw/nhyDoB+au/gtB4nO8/dp3v8Nh
         H2lEhzkKb+WL5MbP/vz34+7it5BYwwsYRXl8jeXyfkZI3ps3QSPAOlAWPqhgzKWLzdsY
         l8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718783207; x=1719388007;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ks8hush9iEp25JS6Wqn/kiRw/D5T+IH/xRVD5S3N0k=;
        b=rJTiq7enuNIWDUbfddbYIzm2+CjcYX8sUHG4Pyl6tBczaulCsHbR0utdy8nSgOvmKe
         9iIq4JAOS+D+BJuhYBKIaCrJ0k+S5bUjRQUUJBHz0II7JcNCxuILeusVUXdcjJFI5mQM
         BETIDKYIpTrymqP1y/5XIggWESJQiWawg39nbkELxOwe0sRjG+mk1ZWCm69YkW2X/KEK
         Uf01YCkLG7pPb6tMV+1t1/E8DwriZ/scb7FO6/vIb2AANq+mEdGwoGKB95pX3oGf9X69
         gLs79U+l81mlCZTHhDU8fq9xOAPLgda9QG6A7jUJyxm03ECJe8+oj6WgynwpVpOiNCgp
         fQHA==
X-Gm-Message-State: AOJu0YzYYLKP8FjVq+QAPWf7Cs29vzTIyUo7nQRMEsqauD525CzhpZr8
	y4+/k69p+1xDdeNrqkUPBhwdmSBurvLzpsaRrF/yuq615BQ2pcJGZNV0oLZkP9LzZSk9YvGFthg
	lfgmK0X++u7nmy9Xit1npbBaZz5KtlSHk
X-Google-Smtp-Source: AGHT+IF/KoBD4/1UUQ8e27DClatAzQxxO8fWsm0SxUpc+L2O3PSTOHGP9CXropa1XSiU+gmyaJUrIgNKJx/YjAAHXN0=
X-Received: by 2002:a17:90a:4ce3:b0:2c7:c306:8a69 with SMTP id
 98e67ed59e1d1-2c7c3069ee5mr906278a91.9.1718783207327; Wed, 19 Jun 2024
 00:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Darius Ski <darius.ski@gmail.com>
Date: Wed, 19 Jun 2024 10:46:35 +0300
Message-ID: <CAKt3Re+AryDYZGyDDC+_ubvWWh7uzt-m7g2-DP53StEjXEvybg@mail.gmail.com>
Subject: [BUG] Intel uncore frequency driver missing half of each package on 6.9.4
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

on a dual INTEL(R) XEON(R) PLATINUM 8558 system, we've upgraded from
6.8.X to 6.9.4 and noticed that turbostat is no longer working.

turbostat: /sys/devices/system/cpu/intel_uncore_frequency/package_01_die_00/current_freq_khz:
open failed: No such file or directory

ls -la /sys/devices/system/cpu/intel_uncore_frequency/
total 0
drwxr-xr-x   4 root root 0 Jun 17 15:29 .
drwxr-xr-x 204 root root 0 Jun 15 21:45 ..
drwxr-xr-x   2 root root 0 Jun 17 15:29 package_00_die_00
drwxr-xr-x   2 root root 0 Jun 17 15:29 package_01_die_01

Seems to be missing a die on each package?

Best regards,

Darius.
