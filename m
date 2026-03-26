Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D653815F7
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566869; cv=none; b=UqkteO1dgug+FB3zEV3iv4D7BuwRcqrIHLP8WPVJBO5gAIy+YWuO9gbhn0dm7yIrVlhYTzn3k5V0pzQL8Ja2GMyaWzl2X0GKIoOQeWR19FUxxmw4tKz00LUa/R48MrgOSeoiDl/7sWyI00dMEc39Qn00aMFFq4OwFIkimZiS7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566869; c=relaxed/simple;
	bh=48FpCbPsFEUsWoCO39+JPm+H6GxcGdKqe6Gc/hK4N2U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RGp2CwO1D2S01TAMMufDWqEgWUji/Lt/j72MG2lz2PR2NjZO2RnjgtsksEA6iA/IkRhTrYoQvRLKwLbd/DmVO5Sx54sEjDak/EeztkcIN7CmVCaiYV3hLAFLLcUfFIuET91wokMUrlNYTfkDtPkRzu9KTuZDFdPyAUPHg1hrzfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpAU3kKS; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpAU3kKS"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64edf260b49so1974079d50.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566867; x=1775171667; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1aD5e+lBji67T6o/PhOfm5G+Cuo73w/ljMhtORmaWc=;
        b=SpAU3kKSjZkm+nFsovgHG+7skQQJgRk5blgJ7bMJUfyuFdDAlogTx/wgb/6aheloCs
         7F6NMnxmcsIKeHlQJ7QV1joa1VheA2rKnlyWzslHJGg0/N/WCT7nxUqAH/lMqPmHLNbe
         HDKbJHykWJKAEP7IpXVCHFdbWdPKQnlxJVeFY4X6D9vp5Gk3Fu/XgpItBeuCeaU+NMi9
         CpyVLAsbCtd0Os77+WZX1ygj4MDjRUvBfk5MJM8x4fmXGxZf5isYraNo4A5H+ji8O5qN
         GZzNB88xT516zmY687yGokxhIoBsQ2mPFHWwGmhciThcWdsDqrX+WGpwtqzmmN7RLGDI
         sCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566867; x=1775171667;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1aD5e+lBji67T6o/PhOfm5G+Cuo73w/ljMhtORmaWc=;
        b=REcgTSzd8PlmtkzOKRUryF0fztsOx1eCOV/mzym3Rc8zPIwVqcfqDXmBy2uLygsc6Q
         GG7TJl/wp9tmJ1FWMB6tf1sCIWVzEmPnxwGxjGCjXKPNfCl9aCIWiQDJzq0GVYeSJeza
         m96w3H/I6R43Z4HRoNi8vhTB1hQmMW7y2HT64PuglgG9N/2I9X6Ih3ZSyNj/hldh2BOO
         lFbA+Tfi9jagPXZm2zbw7XtQLB5nqiikrhXvivsm8kHeFLgEKkInQEPMbuCyGa/LWqQk
         JQnoh3Jar8orJ9NowygJG/7TQTX3uJRRvUaewUTvyCez/bdqw2X18cJg89N1jaxu6hKj
         PYdQ==
X-Gm-Message-State: AOJu0YzXh/81k9Ww5q1wsdUH/7FUYAP6+zSP3BA1Cura/W8S8R46z1K2
	mPE9H12qICm3JqZF90tbJe64NXrMZpN2lMnst/rJsVeAhBkL4iOvqhSO
X-Gm-Gg: ATEYQzw0VNn/9Jk4eQvJcBevihRbF0EsCE70mg94W/MfV6RnnJRE8fK+dJXS+4CP0Nz
	gAkIjk+LqD2R8qVJQhgFocqkfxPsFc2K4y7rRW+HcoO3vimZKgl/pBKmjn7z3enFvnHNj1I46qX
	kC42f76iCnnZ2TGlZObnGx36t7/e3vZ3Ynu+UxPxSLXDIiTeN4AhynzNT1GLCEkGga0SqNqTu62
	oHM5T5Afd+KoLcMTETRPyQOr/Sf6mF16FJvg8BjJxaLlygzmXkw6f3iPATEGTG+T6sMEQ+4gYIw
	C5rGQh0NiHxRccTjABb5uxEW2sXmr/nLGQy3iiK0trpkJvGuBGqDW2lID8Qah1T7osAyBa+U8J5
	QeKAFq1HbHgSU+T63xzLRI55ctdDTJmUnJEzG4krWtzqP7uui0ihfM4Z+bB+4SQRag9KGABYV93
	p17qhjc53zrAH8otmFYk7xlhNmWb/NTAeBIt/s22OtMDDWvOpz9VMPoDKhrVCFzOHtam+jlpwYc
	BIixfSZHdCiZYdzCNDFqhHvmNqZZPbl
X-Received: by 2002:a05:690e:d0c:b0:64a:cce8:de39 with SMTP id 956f58d0204a3-64ff84b39camr157604d50.4.1774566862689;
        Thu, 26 Mar 2026 16:14:22 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ef58d0fd8sm2304436d50.8.2026.03.26.16.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 16:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 18:14:14 -0500
Message-Id: <DHD3G6MK02WZ.1W7C6S7BQKE8I@gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: asus-wmi: Clean up
 asus_wmi_set_devstate()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Corentin Chary"
 <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, "Denis
 Benato" <denis.benato@linux.dev>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326231154.856729-1-ethantidmore06@gmail.com>
In-Reply-To: <20260326231154.856729-1-ethantidmore06@gmail.com>

On Thu Mar 26, 2026 at 6:11 PM CDT, Ethan Tidmore wrote:
> Remove redundant control flow in asus_wmi_set_devstate() and refactor
> control flow to improve readability.
>
> Ethan Tidmore (2):
>   platform/x86: asus-wmi: Remove redundant condition
>   platform/x86: asus-wmi: Refactor control flow
>
>  drivers/platform/x86/asus-wmi.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)

I meant to say update_screenpad_bl_status() instead of
asus_wmi_set_devstate().

Thanks,

ET
