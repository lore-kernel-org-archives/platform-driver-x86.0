Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6222C11EB
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597633; cv=none; b=koiaLBHDQDtLjx/EF6SYD0T/i+fILDl2vM++9yaYYAYKJ+d9MpHvEGueIGKs2rN0hFrfPt3wVQMaKgRSiwrm6K77douwjIlkCDJd+YVdURczPMqXmH3q3Guby4UrC4Wrq/PAprZifLspVl+YSFGLsbKobZOClVxiT+1nbjYBS98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597633; c=relaxed/simple;
	bh=9wlOezDaf1W3GwhdLxNT3uxXR6Sx/RMaJgLElBtxZPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atIJmSIEtBpNfzykubn5Yp5MSTSMQPjS0m20M3hAVedL3Sp2apwx6sIUPuWT7xEGqFqywFTMV1q4NNiTmqmyqzq2jfBkiDvQIKkkuvLGKgm+dlzv+G/b6m6aMKL1Ob+YnGfPuWCW0dYkjaU1BETcLZZkawO+FrE9SdvtYpNWzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyhALz7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyhALz7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9818DC4CEF1;
	Mon, 27 Oct 2025 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761597633;
	bh=9wlOezDaf1W3GwhdLxNT3uxXR6Sx/RMaJgLElBtxZPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GyhALz7Nz9ucendwevL8HtZ3Hvh8KE+mE3PmX6KjBoCYrEd6G2+5hdYOp6WOi3OU4
	 vKhj7ekQyBTtA/3by1KRX6gnISSq2NH3rS8igy5VvJtQwqFPMfoY80D1yrt1J/qhHJ
	 b9UkSNVzfILi0AQ7oP0FTPFs7RuTDxLkOJjjG8QEHnJOSs3riVZi/jo3BjHWrB/q9F
	 FzN5pkfOLXTHsvWp6ud0bZ6wpRr76BBIpqaCJ2P3gSF0BxmTxJvoXT/OvYsp6WPRey
	 Tr3IeCrmx+tt9PU6hwPio76rKDgodHEwvHTh7vZ03lGOSTDZn9PB4YisKOwr9ZOx+Z
	 jl20keQLX+BQw==
Message-ID: <3896a83f-c7b4-4ba4-a223-946562fb21a3@kernel.org>
Date: Mon, 27 Oct 2025 15:40:31 -0500
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
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
 <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
 <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 3:17 PM, Lars Francke wrote:
>> See if this one helps.  I do think we still need a PMF change though too.
> 
> I tried it. System crashes again with:
> 
> Oct 27 21:13:51 lars-laptop kernel: BUG: kernel NULL pointer
> dereference, address: 00000000000003fc
> Oct 27 21:13:51 lars-laptop kernel: #PF: supervisor read access in kernel mode
> Oct 27 21:13:51 lars-laptop kernel: #PF: error_code(0x0000) - not-present page
> 
> Cheers,
> Lars

OK thanks for checking.  Any chance there is a trace below that?  Or is 
that is all you see?
