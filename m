Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D86EEC0
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777229233; cv=none; b=GAJuRyISblavM6R+OPQqK/1US3cbZ2XnGzTuXGYpkq6Es3kng8IFglVZFEdzmI1J7CXdly5prqlMwo64wvl9yiB93nptPQjBzieKMaCr8AVmyFyx7vlFqMfRwY/mj80zQmHJamrHtAzj6+CRIjO1nKExwrwM2UccjZ3M/aqhJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777229233; c=relaxed/simple;
	bh=40f7rEFqR6Ug5kyMHD2r7DHdyHOW+wmg2jDCZuu+QJ4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=I9tbybcB+jV5J/EM4AwWvtc3bfqhR71aUw4rUOBtXA6fpnCqWJMOoxr81vfSfFS150vOZTICwYWJjhGYj35UgJ0RTT6P9r4KXYXGQEMCJ0dEK/Zv1UF50bcgagYN5T/2TsoVvgXf4d2/BsMl0IYaxkidHcFGErvnoBzliDwFjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5Va3Sbs; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5Va3Sbs"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c15849aa2cso12446994eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777229231; x=1777834031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O8ZvOUiwDu16iFcd+HoNf/DK6B/xDXTpW2Inyx4d500=;
        b=m5Va3Sbsb1xv0TcETamb//Hqj40L+nbR42J5018laN+IfB9WofZ2C9plBkqn4/UvW3
         F79yniHqGuhTG+73T7NkjQ6cSZ3xvQSmoEYpKKAPAZLBXSPJuaviXFFLi2cE3P9B0W6k
         SenR5MBXQIXtpH8/AyHyh3V35wL5NNovjWIiGJnbeA2tavfM3fvR+Jmqb5f27LvlvuMG
         nd4sugPOy4+PPRgRf9IIi7mXApciKc95rUW/n6pZTo6iVV0ZDC9uV0rDMmkRbQuXpDlm
         9rEdi4Yn7l6LoDhVj+86G6RYRAyd5TCrAo5n+rIwcSvS+Gn5gxnuO8Z7s+R44D0qzdp2
         n5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777229231; x=1777834031;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8ZvOUiwDu16iFcd+HoNf/DK6B/xDXTpW2Inyx4d500=;
        b=BdsVYVS3/ygxPInS6bXMBHHCn+wqHXaqriLyzG3EZo1diP9EEcMMlt4ujxG7Z+Vn1X
         68LZZcGDEK+7j2LJZ3iH1Y9PsbBy84OVhJNbf0HFkX34Tul+e4rn8WLln6VJvMBlQ2a3
         8VjeAYKL/ngjZWCm5S8Fhj4lni0A0ofTTPgXsxfuEOpj1zOQKLp8oNPRzLx5v1acPDs2
         5Ej7vCqDW/2LdbjL6NwNPuIrwOvLeOuXhdL4g5NgplVcxgALjJ5XrgJhbqpO2Tqa5eli
         tCAfBBNg/sG/JGzkQznAcklXZ8mHv4i1MjMqY4fNUr1uHY5RrunOG2ssYJApt/Xx0or3
         X2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X9+XiAHnMPpgdsv0a+XfiQvFUKcq4vPv3Y++J9PZCES9hn0O5FekennROfuyS3lr7XpfOxB5Rb2mYTADsQodP2HUR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vjR7V7MRrHCLs/QAEtbHKaZ2bL0BylAZIBO9m8BrFTEE5Nf5
	xoLy4Z8GyY4KElVSh2bj7pO4Q4Sstmhd7ThOTE7yMGiLCuMBvgshNN4x
X-Gm-Gg: AeBDievmhLBm5gO+OlX1MR+A3XdT91V9BFFgFz97+LafbJl/5rfdIz9jT7i4mco8lsy
	gJWae36GPo/YZ6yNzSzyVPT0zN7RkEVIiUeBGK0MzigXp+fDA4Vr+9P5ASDCnz/49xKBnU3inl1
	w0Ll83/Xtn52TKfIo9FUVDqPIc16skAkZg0kJn9YRIVlzrSvw1+FzZHpCJmTHcLNiYnaxI1Cv5q
	1mrUn+jLr9KpuS/6cKH4ptgYQy2lncAXgSxObjs82tqO/EGatYxT0nN3QYtQTjlTJG5JYgzGApf
	WECadJvIkJnZY3zuTox60xIgLJbcsEAPRIKi/qxKJnnwbvYI5/ekhdQPgf52cwtRjQnj3i/0EIZ
	qt8KEob6gJ8nqRqjN9SdjUE9Osj8YIQjqnhlz4MpE2vTK7ydw/VwUpuHE594wF9kHw+8YSg1nu+
	+TXzWa99PrZy+kQSQIp/MTO1++Mhlq2Q8IInCPB/vftMo0swgTDQO3vqLKgD8/VfzSpOUgT6wFi
	4GQTktQPGHaS46xe2FSgcI0Wf3ztUHe
X-Received: by 2002:a05:7300:5997:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2eacd391c70mr6146770eec.26.1777229231195;
        Sun, 26 Apr 2026 11:47:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm41712334eec.13.2026.04.26.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 11:47:10 -0700 (PDT)
Date: Sun, 26 Apr 2026 11:47:10 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: no name <cd345al@gmail.com>, mpearson-lenovo@squebb.ca, i@rong.moe
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
User-Agent: Thunderbird for Android
In-Reply-To: <CALoEd=GncBHeSOh7eqmVaJrKWNGLsFEyh5TsF87boSQgsDM0vg@mail.gmail.com>
References: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe> <20260426174332.9981-1-cd345al@gmail.com> <F095C80C-C233-4A50-ADC2-EC932563E1EC@gmail.com> <CALoEd=GncBHeSOh7eqmVaJrKWNGLsFEyh5TsF87boSQgsDM0vg@mail.gmail.com>
Message-ID: <5BB41C4A-12DC-4059-9C97-CBBA4226DFC6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2026 11:38:35 AM PDT, no name <cd345al@gmail=2Ecom> wrote:
>Hi, Derek,
>Thanks for your reply!
>
>On Mon, Apr 27, 2026 at 2:22=E2=80=AFAM Derek J=2E Clark
><derekjohn=2Eclark@gmail=2Ecom> wrote:
>> Hi Yufei,
>>
>> This bug is already addressed in a patch series that has been submitted=
 and is awaiting review from the subsystem maintainers=2E
>>
>Which bug do you mean specifically? The args=2Earg1 uninitialized bug,
>or the original uninitialized 'raw' variable, or the inappropriate
>encapsulation?

I was replying to that specific part of your email,  regarding the args in=
itializing=2E=20

See <https://lore=2Ekernel=2Eorg/platform-driver-x86/20260412211121=2E2220=
556-1-derekjohn=2Eclark@gmail=2Ecom/T/#mc7f4ab5f74cd2fa21eedcb6d91488b76d3b=
a3f31>

Thanks,
Derek

>> >I may do some refactor recently, and I'm happy to hear your suggestion=
s=2E
>>
>> Rong has a large refactor series queued up to simplify much of the driv=
er already, pending the acceptance of the previously mentioned series=2E It=
 would be best to avoid doing any additional large refactoring until that s=
eries has landed=2E
>>
>OK, that sounds good=2E I'll wait until the refactor is done=2E I hope my
>suggestions can be adopted or we can discuss further about the
>appropriate architecture=2E I'm happy to hear your suggestions=2E
>
>Thanks,
>Yufei

