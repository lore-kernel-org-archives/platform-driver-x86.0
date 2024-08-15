Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A11B3F03
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Aug 2024 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723739310; cv=none; b=b3lAMndRva1kL4W+vkKniulimRakipXWnHtfobUobAOs+DHa0RxXp/VySprUGswrMdpWf3VNu5sA8o68BB/eeIPfbLwx7Ey5M3XPieQictNw1EyVXSYfVI0hEoJfkU+eJTusc47Rk8ROU4ynqQ5pPoQpwcC4PMFr7jiJLg7VOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723739310; c=relaxed/simple;
	bh=GymEXGYTUnDU3IhQ/bYlQp8BogE7cg43Xo+Fx3TE+2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwhdUdtVOOp2YX5UEuKu2Rla88x4XNvlST42IaFsr31X0a3eZDC1EaGZ2uwcL6geq9xEOrNNeH13S7DXG13Jb9J6EIl4TYISy7zlY+xFHFlk23IALJKpaBfSl0fhnI69kw0pYYpKkMA7vcJY+mLAM3KHF0jMR/imBn8eh6jvSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXWhr0vn; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXWhr0vn"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-842f00b7352so350355241.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Aug 2024 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723739307; x=1724344107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GymEXGYTUnDU3IhQ/bYlQp8BogE7cg43Xo+Fx3TE+2w=;
        b=LXWhr0vnqbBrlv20fmRsTvbUOJin9kkFh1PXJPdpSy4u2L4ZfvKDLbQ7l8W0Dtf5ti
         cNoW7IldYYbXG9/RYPcSaNbWWfZGSZ4bHMhTmj/txOJHUeD0vuMcoq9Un+YoVhYmwG9u
         Al5IYuVuL3zla8Y8BIOId40hOnYd1Kdre7T05qvNdqhpsTyqbu//ZYe9vBjJ0yD8/8Nw
         uCkZrdrPdRmAR5hsGTgWFl1OTsPaPfDlYdGYlnetA+0F1kdQX6ownoe8vWWEkAMnVoAl
         PMzvhcLQtVU0uLxO4HTXbvR6EbDWvFJebCdXQkyfInglWbdimdZJxsCOhSeelULj74S+
         fQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723739307; x=1724344107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GymEXGYTUnDU3IhQ/bYlQp8BogE7cg43Xo+Fx3TE+2w=;
        b=ZnEmv2zCP4yultJlycQzmM//cAZFrSwqZAl42qqnJXLKC2RfO5mvCh/NsSXc4DKdUH
         /5dj4Z2dnVXctJTJXBb3IAq9sYeLzxCp4o5qKQhLFTqAfoBnQh6GAKxn1zi2GNIfOcEI
         s1vRaFsYAyxfCLgib+0girp90WniuQ/j2kCXlrAT5pRv+G5x62fnGKChezvULKr/dZ2b
         0KDhTcqIp0wvAZkWGMFyrQGq7T6tTcQmFE5iefLPxJLc3e1elgmh2Jih4FiDv6YmGb0Z
         fmoPjoG9eHnkeMK1dc4PRrm/eX7M9wt0xjkRu8KR1YRo7CR11LYzTd/sF7WSPi68cbIo
         dHHg==
X-Gm-Message-State: AOJu0Yzrd7H+RmVK6aHnkfIu5+DLGmU1eXxoJDxMNkWuphFUrsgvttHE
	3ONXrhDUkoUthJQRZHKJO6Fau+1fR2mUxRpUKa72M9HoCas+ywJ6+GxTF4PqB3fF6TXIkBNC6EG
	wUvviXFnIsmLpEKjtYqcVf3M8REJhKQ==
X-Google-Smtp-Source: AGHT+IF4lwYHr3W23Rsax9uUX55oQVfdTdtwfZrQihN7yNeOCV94RsHKma4vUfTXMtwJ8Kad8Iwduc+wl1uYyjWeaNs=
X-Received: by 2002:a05:6122:2a0e:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-4fc6c9b0fb5mr409840e0c.9.1723739307167; Thu, 15 Aug 2024
 09:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
 <749421fc-73d9-4657-86f4-40cc048265f4@gmx.de> <CACzB==427GUH4b571KuVDzh6EsG7kB4bb00hmLu=7OzEt4QrCw@mail.gmail.com>
 <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
In-Reply-To: <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Thu, 15 Aug 2024 17:28:16 +0100
Message-ID: <CACzB==4tJ-NQbS9GjJqNW3c_tEDiggEq_cbag674nyy0h0C-WQ@mail.gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 1:31=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
> I will try to create a prototype driver so we can take a better look at t=
he fan-related WMI methods.
>
> Thanks,
> Armin Wolf

Okay! let me know when you need me to test this driver, happy to do so!

Thank you,
Rayan Margham
