Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEC8286D70
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 21:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513386; cv=none; b=Iqiuu3/4msvc5r/DlZIFBm4EhJHFn3uAANnmxyJG+veldSexDY2zXwbKYY1hrQRKBK8hpSMrfUqm/eR4IHo1prCHmi8GwKN634FvLgLqFfAXUVnKWaDLd4lzG6p9zkqetzl1n4Y0zxy0wq8d+GfTBZdZwfoo3RdLjHHcgH3h8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513386; c=relaxed/simple;
	bh=glc21ekWasgPIN8FH4budqg0TYeTSN7avtWCIVontyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNi2fWvZbnhcXnIHwitXxNevzJCmEeT/4rwmn81NzUn3+in+urFPQfsZDnmTyik+kRlHJN+eUICOjZvnm4gZTu//bC/cQMu+dh5tiXZlk6WOsiiYLrzqDhkd/CJFb64dSsUC13yiDDGcajS9kdnlzr03AuT6cFiUzJTZjpdeJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVrpe3Hj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVrpe3Hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D43C4CEE7;
	Sun, 26 Oct 2025 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761513385;
	bh=glc21ekWasgPIN8FH4budqg0TYeTSN7avtWCIVontyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nVrpe3Hj0p9mfCc0OPNee8q76sEiz1tRodw6JJ6FxFHvaf53/Nn9yOqc5owySQtKZ
	 ybJP461urKAJBlVjMXwv4MNgGI005T0/fIGRfX1eNytH8OHxK2Qpc1H8hpQuRVZnnB
	 dmV2x0I3lAoKCs87ivj2CYDXhjsjB44xL9ORkbIV9pMmI2G8WxlKLDWA8d+GhYr6R7
	 TJ3+bu3Psv/bCT0Dgg/LmAFKAa+nhsdk83qzfNd8C9MfRW5NaY1mTsYa1Rm91OkicJ
	 O3PUa8KsHvvyWZKMYEVsVzaJzXIxJydSCMI31Ermjxc5B7uCWTfs3ZlKo70yKQiR2y
	 NObMqCpilyFMA==
Message-ID: <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
Date: Sun, 26 Oct 2025 16:16:23 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/25 3:39 PM, Lars Francke wrote:
>> Can you try this attached patch which inserts that flow to see if it
>> helps?
> 
> I haven't build my own kernel in a good 20 years, I'm on it though.
> I've applied it on top of 6.17.5 - is that good or do I need something
> newer (6.18 or similar)?
> 
> Thanks!

6.17.5 should be fine.  But I suggest you add both patches.  It would be 
a nice confirmation if the other patch fixes your power off after 
hibernate issue.
