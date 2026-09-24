Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE434EB85E
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286797; cv=none; b=pIBSngrvH+bA7o5VmbmjrBj3LwJRTPhbDtL1y5xDpDA7pQcfr2z78o77eO1qi3YsnDfkMAYEgaMpg6V6S8AOXflmYir80gsw/caWuLUdjJdx3MjiyOC1Q8SEXbgqZfqC/MUhlPhMSNrFzikAoE2iQUi6gp2vr7C7xra5c1yfB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286797; c=relaxed/simple;
	bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3yX4tiSNq27BTgDrmWb4QWcLsnATh7G4PCruhyLf4mQldtZhU8rFIg1wkdC7OMLrC+McmKwUo4bP7xhzN8w45J34OMC+Wo5dhK5I+slZfZmhiEjfmW4d4hC9GOltWI8EFSd3VJVqNEXel7RFgVz8/29DK1vywfErnvTxtyaF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYrXMKfF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYrXMKfF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so3026565e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286790; x=1790891590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
        b=FYrXMKfFuAhNF5aCQVPp9k70aZHLhA5y5y7FHJxEF4Cgx16UZb8Wh570H78iixISQc
         VpF1eAnRuohAFSDR7cUU3I+zypSleeCnUiIzME1/76SDe+P8HBxG12VgJpzaufB07scV
         sSopUoV1c6a+0C0jcWF11L5O+3mh4/MoITbUH9W6RhvlCP6aiKuEbiH6MF13cxRyYSjx
         8oUO6wtI+N0XmO13bsw9XePdvAUAHS0Orr57nO5pnBYb3lVuU423CENcCI+DEz4td3kj
         bm86dLsuIUEhJCUT7fEUCYQr5w+M9VsV+FSOXNcgS3YGNubtD/bRUReRMZ9jTvH6hyHf
         qj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286790; x=1790891590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
        b=bN1DRiDgacXD5n6Lep25xxgpWlB3o/IbYTSq7XHcBNyWokHrHq5AnpRJ/vMGODjs0S
         ESPZrRx20zfYCl5ex4DIu81K/w8tBpUECSU3ZFUlG3l5ob2vaTmKfq4r1KfgdTXoaf7Z
         3RckrWriSGmcrV37QXyDSq7avi2KEPPmN27EIuRY169+CJtp/IocTXYMKq1t/fxKwXEV
         WlFJXSFZpwEAg8exVVwEhaXrJa6HqSK81EX49EXG0yx8J4cVh/yd3+Uyh1WfpNqdL567
         lPXDw7IPcRl5QxjeEclgw7WzEiz/WOaPSZ72IyFPTakzAjZXl3bGe0UYH5ELZFgwcq6P
         Rx1g==
X-Forwarded-Encrypted: i=1; AKwUvBwW58wLbryUllfwZ7BKhiKcFQ05WJSXUE9TxYxfs9wMPx3FN7XCD1Y0bdJvyl/ekFoXrC0eQ/4Ii+BO3L3Petokkm9k@vger.kernel.org
X-Gm-Message-State: AFuF++loB4qG9dLKCk5mnW0tMboT+3fxQ6OXG/HseilEZw+jsUIqPXAe
	KjyxwmTtmAyFQZPNNzx4+Zvatmj30/tU49Z0zE4Hc7H4UdknZ7JJewf1L7tc/Y70JC0=
X-Gm-Gg: AYBFou0tcmqFUZY8kMpfFggX0BBYJRR7xJk9sTB2gYb3AxgGuTsrtQAzjXJfdy2pvfS
	bY0gETBcYdFGWh9puNa1niEbrkS9HvFI5Y8LpYW87h6wGSccgjYuRtDMnSGz/Eq4LUbsQS4kZtw
	zMaU+6SsB+FIZkCYIPdx0ae+bw0jrbRjQzGdb70b29JsiP8GtxxCEvONYliKDdjBxZTcAZ1MY7Q
	yrXAsE4LkbDzUm1T98HPpxNBQVRIdTB8E6+gp/RtjIrE2ldMlDuVaKA5lbPgraLq/e0Mpyl98Aj
	PYgvXUuYmZrov9okPq+y+6QxgZNbHux83DLNmTAdM2wINkFFAW/SoBsOwgWgeh7tGgW6Xs2r431
	nP3FX3p2zTKbL6wDxJyx6OLiFfMt4p0JKclg0KB2mmJRnFqygV4O1qiciP5JLB4wuT7Cs8Ytvjb
	bnGs3SSkjO6yfwoqqQaku4JkoUvaNrJSwjkkKqymbOiUe8QmHQVHfQ0Iy8Q2Eu6iKOOWVERx4B/
	xSZ67ybeZ6Cpf6IQ1DkdQtfK/j8ltxQutQgTugl+DQqz+e52yLnB0y4yF7NBCYAHMzMIxuPMOCK
	Llqc6jlJyfzkV1i7+g==
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr63220665e9.20.1790286790425;
        Thu, 24 Sep 2026 14:53:10 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff1419498sm991635e9.3.2026.09.24.14.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:53:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Thu, 24 Sep 2026 23:53:06 +0200
Message-ID: <20260924215306.930909-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans,

This v3 series has been pending since August 30. It incorporates Dmitry's
feedback by describing the RT5677 GPIOs with a codec-attached software node
and reprobes the codec after attaching it. The series remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
