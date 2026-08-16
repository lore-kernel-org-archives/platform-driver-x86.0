Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EDE157A5A
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786862547; cv=none; b=jqKGvsj2767Izdmg9twR0M5jpP9oXTThwvqkwe9gXzrdh9+BeAAcUsfiVTidmD6e3BbSA1hMYhw+GgKxJlvljbOGOQdSMf2Xs51wzRRE/UpJB6tDswoYi7ffo2ruJXCgorLUUySjOJ/RCXNNZO+UJHXeKdlhbJWM67zPBOsaqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786862547; c=relaxed/simple;
	bh=mznMh4fx1QLse6T9lEVEGuEJnoPM/YypU2TMDwii6pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=My5mysbjsjDgkKyGma3b9CGCJaqN9fySK9asX2QISExlsjOqTp97yf+8fCklCg2+ZqQxyGnmiVgvdpiFq7e2qQTgKDnpEOUST7fIvq8HW6vaf1sWUEd6A/AlF003cjwlNbsRtNanav9svTKgb1+L4A7ZXvOppB6H7cRXx3iNjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp34Df6H; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp34Df6H"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485b358552so445569b3a.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 23:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786862544; x=1787467344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mznMh4fx1QLse6T9lEVEGuEJnoPM/YypU2TMDwii6pE=;
        b=Vp34Df6HtSQWKvASGkz/grthJJtpzxRV0z7kZu+Mkt7sl06690aA/rtnKcRMLqohr5
         LMxmUb5QzAj7GuCNmqSTnI6/mBug7lKo89w+dtrABU2J3w/zo507qrc+jI8dQtiJMZCK
         /7lWBDD9xS0YwTGoc4lf5SHvOOVE251l9nCpbHUpLzzMFe7uVujF64eCD0cN/Z74tNVq
         4TfGxoCzyJDFlybuLLp3BJlcpAhiW7OA703NhTt4+WGIqh7yOtOeghzeHfi3aS+KXqPx
         63TyKwZR/c9eAIglFOyA2soQqfLP3+f8oE6lc0uGOg6ORCmgruC0rtXB92NYkqZ2jG69
         0jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786862544; x=1787467344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mznMh4fx1QLse6T9lEVEGuEJnoPM/YypU2TMDwii6pE=;
        b=K0TueS0BJRi+W4cqk376FYqObsS78MhLeY36By95E38ghvd24S2cys0Uc92eMmd7m9
         IZvDyhvzFZK2PzM5TC17jTfszXhRryvS43OhhJ2C9Mg7ig7MFshud8UFbs4DsJx+LhoW
         wZeaax/NZlnGPF9xUzejCeaiAM92L6fXN83bugV6EkSRL17/hPT/DgsmxW6R4xgoI3CY
         KIbeZEHQVByTVW46Ph2Zni1SDUOueEKzaZVCFstzhuUuLM1CJBzNHfj6YkmtriDNrLwr
         66oeT+TvAXRXLsFUHvd5l9DGKnEsTAtVuO5ZxreklsCUjRzAQBcwviLffElfd2hhRRcd
         38SA==
X-Gm-Message-State: AOJu0Yzr0rLFLAlVPgdDyK2XjYrwufB9QWTENJ+1qIP5p2dsnRZuvUcF
	oVQxdk5nfuLiHZsDSlncKVDf8kwNIMdjMjbEIbhc/z8tPjPJoNkHwoQU
X-Gm-Gg: AR+sD130pTFsga6xMhl5qe3Ignsg6/WFJoyaep/HnqMOj3TjrSSZ/8ZXhDHYNu3qD3I
	7uAM6P1BgH6BfChIVrXwTmBqruETbL65ZBj/Jo0/GR/SdqtcvRrxS5ow2wgFK9UYZgUibk6C0Hw
	6yJJQP29QMXJPpBlDfGRuawW8axMkMh7Fo3+AA+bdYZaNyGclXcuXcHzENlXSO5yraiB02AeLwF
	Rwyxhj/E3jGoazi5Wv6NWDwNGtywCfgx/1klIwD7a4Ltt4q9Q2M660xoU7Fjnwwc3MJoKnjt4fk
	vxJoK7c9/pb9CVb++O9bX6cqui2XxKhC21ktNqibM4JAFaJW9/a+4o7VqU8NJJ4jXZxbWXaVNOu
	WjVzaRby3w3CRkLILg6oUB6Qn8unqiMMj6atifmXs/wifbk1sGzVe5fqdsI7T8uirB8xNlB53CI
	oLCPM8Do2FUeXqKlfWIIfU/GCH37VhKJKUIJU=
X-Received: by 2002:a05:6a00:301e:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84fde20e20bmr18544137b3a.22.1786862544105;
        Sat, 15 Aug 2026 23:42:24 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26c37asm1678843b3a.60.2026.08.15.23.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 23:42:23 -0700 (PDT)
Message-ID: <77155747-5550-468f-b8af-c25b713e9c14@gmail.com>
Date: Sun, 16 Aug 2026 14:42:20 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] bitland-mifs-wmi: Power profiles not working on Xiaomi Mi
 NoteBook Ultra
To: Bheda Rahul <rahulbheda131313@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
 <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com>
 <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
 <46295e2a-0e27-4936-a04a-2f8c71560740@gmail.com>
 <CAEX=436MOAPVPdqsupWFk5=2naeB1ghgRFCYi8FiLeGk9MLZDw@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAEX=436MOAPVPdqsupWFk5=2naeB1ghgRFCYi8FiLeGk9MLZDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/26 2:41 PM, Bheda Rahul wrote:
> Ok does master branch of linux fine or other branch.
> Thanks

On the master branch.

And don't top post

