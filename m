Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E31C9DC9
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Oct 2024 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862533; cv=none; b=JlRBcq4oFhl9gU1eyMdNFKi0LnEaMhnCdssoF0JfY8qEbrGXMnaT9/mWVtu0/kUpD/8uSG4nXYf2h8Jinfd9WKjqDGluz4wr5iHbUdNFsB6FHgh34pIVEGDLCUB8hBVzv9RmWaGOKv9w1RIPw8vnAaIRQjAn2p2s8FmnHQ4sFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862533; c=relaxed/simple;
	bh=OK7fnADrOEDQ9q2bhVkcS1wSQal2jopIshMwSL6sdfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaKc/HhnlQZoz3vRGpOFv+XMWkSl0pgSijY6lrnTgCPBOV9OCOJw11MCnrgloQnrSf+jsTr6sVRr++5i95loMeIBnGXjP9zIV/FdGOimTldlHl9neE+6ClzrD27xzhs2vOy2bHkWQlwGnbZ/8a4LHJEDL3HQXXvDIKxjRK60wAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=P+5SvgAw; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=UNV2AFCh; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="P+5SvgAw";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="UNV2AFCh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Go/yIGXZZW4c59q+SSNU3vMMuo4JirlxvCl+m+AwjLY=;
	t=1727862530;x=1727952530; 
	b=P+5SvgAw6Nvf83dDqwGvLWnWcY+mEbxONOsAq9ooRwzEGhPE+1CiodKrnfvG6GxWrrHZdu3aNku6kkYybEnzY68CBDlbhTmkCEgNxwMGLtiWrAemwGV6Z3wPsMhSCA0gU9s92weP0HAaOPx/20hf6pkzHdwLnSruOzrFosP+Q797INrYmmc96KtVuJxiunnPD4vVJ4C1LfArQVXZU8GHf8QZKFU5Oxaju1SEDzSRclNN6o++7dTzi/fSQzxl7S0OokJCm3RtoGOZnLetB4N7QiREMXj33gLgXIN6dUr2N4vlgnJFbFHkMORN1sLMvNzWCv6phJj3lDM4Y3s0CLaloQ==;
Received: from [10.12.4.28] (port=44312 helo=smtp52.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <al.safonov@inbox.ru>)
	id 1svvyM-0042hR-1Z; Wed, 02 Oct 2024 12:48:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=Go/yIGXZZW4c59q+SSNU3vMMuo4JirlxvCl+m+AwjLY=; t=1727862522; x=1727952522; 
	b=UNV2AFCh57YkVNK+JKb6wBsvP4lt/4qiRn3QMXf0HJ4oWbGcVjg/QaR6kdgx1gk6+GuShdwG7Is
	DPQ6WrLwpylBfWog7Mgb6t+qn3J8E8yBbFz0UQ3ErSRbeu8cFnr6H0YU1lF8GFMNgwAen+zt9gD5z
	LQ0F0G5d6lVv0Fs9jxYzN5WZG7eHPDQ+WSCzEaIRrbL1XMv0bxaR8QvFv/cdwPNjq2s/I/pROSoqO
	QmwUwW2y/VbXpVKOuwhWMFaNLFnMGxVYD9KBIzdvkdLxx4FmKzpxnv3c+RmnDwkD887WW3mmpJxop
	6zpuCNRmK/1YQjY6m4qmGMJ/NzHSPjNFPN4g==;
Received: by exim-smtp-5858d4dbf5-n8wmq with esmtpa (envelope-from <al.safonov@inbox.ru>)
	id 1svvyD-00000000QJ4-0RFu; Wed, 02 Oct 2024 12:48:33 +0300
Message-ID: <1a7e7d54-20de-4510-8ce0-cae2c2779041@inbox.ru>
Date: Wed, 2 Oct 2024 12:48:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Improving WMI support for Predator/Nitro laptops
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <d1a92068-2498-4892-8294-532222b4d94d@inbox.ru>
 <446996ed-8e5d-4d8f-9b82-248150723614@gmx.de>
Content-Language: en-US
From: Alexander Safonov <al.safonov@inbox.ru>
In-Reply-To: <446996ed-8e5d-4d8f-9b82-248150723614@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD964E86F54238FCC39950CF8D1D6B22119A72C4316E915838B182A05F538085040F63734CB6277DF823DE06ABAFEAF6705787242E09C646C42E7667CC07777C9FA68A59ACE1A350C76
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7922D113DFDC6D5A3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DEEC83A7CF8598608638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8184647A836401B8FF4BAEE7EF4AB7AD7C21F6FC3A0AAFA7320879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249957A4DEDD2346B42CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C091DAD9F922AA71188941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C031128297CE6726AF7B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F1E561CDFBCA1751FE45489B29CB19804B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B91170FDE43A34AEC75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A57BB89CD73C0C5FF25002B1117B3ED69642B77CAE02566847C81EEE05487B0209823CB91A9FED034534781492E4B8EEADB1D70E2111C441FFBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D348D68DCC07DD06FF50319584EE37AF7484CA8EFB53615163008B18595D24AFA412586D2C510661F241D7E09C32AA3244C30F3E1778EA59F1677DD89D51EBB77428A2A91D60D5ADD8CEA455F16B58544A2D06CB91D864A7BD2E57A8CE2CFE77B91AB5EBD88EB3327CC94DF6AD25FB923F737E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHMr0s/SL0PVSJ5EVgiCk2A==
X-Mailru-Sender: 8D8322B237BDCDFFD1A3F1940C981461E3B83553625C45D83DE06ABAFEAF6705787242E09C646C42130BB289A1C4FBB98AC0361A536CCCDD5A92E71CC7C3152DD1EF35668375B120295E34F9751C493A83151E681B00950BC77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B46C37AA6CA18C1105A7F0BBCB4B36EEFDDF3700FA0CB5AC15049FFFDB7839CE9E3B9205FA515F7010FD3F854E31BC20964A8423B7455828F91AB1280A6D2AF3D3
X-7FA49CB5: 0D63561A33F958A5826CA6DD373D269A1F28A7983A17272D1B12F6AAA3CA6B69CACD7DF95DA8FC8BD5E8D9A59859A8B631C0090ACECF247DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637C6959D404C7CBA91389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85149A672E96B27E1F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7190CF154FAC3CFDD731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHMr0s/SL0PW/QELVoG/Ifw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

On 02.10.2024 08:40, Armin Wolf wrote:
> the documentation at 
> https://docs.kernel.org/userspace-api/sysfs-platform_profile.html says:
>
> "It is explicitly NOT a goal of this API to let userspace know about 
> any sub-optimal conditions
> which are impeding reaching the requested performance level."

OK, I misread this statement. Now I realize that we should always
report all supported profiles and, in particular, not report errors if
the desired profile cannot be set at the moment.

> So i think the acer-wmi driver should automatically switch to turbo 
> mode if:
>
> 1. Turbo mode is currently selected.
> 2. It receives event 9 indicating that it can switch to turbo mode.
>
> I think commit d23430233494 ("platform/x86: hp-wmi: Fix platform 
> profile option switch bug on Omen and Victus laptops")
> might be a good example on what to do in such a situation. Exporting 
> the availability of turbo mode via sysfs is optional.
>
> Please note that you cannot modify platform_profile_handler.choices at 
> runtime, so you have to "hide" such things like
> "cannot reach turbo mode yet" from userspace.
>
> Thanks,
> Armin Wolf
Thank you for the hint, I will implement the similar logic for the 
acer-wmi driver as well.
It seems that being able to set any desired platform profile and store 
it in an internal
variable makes the design cleaner.

In that case, exporting the actual availability of high-performance 
profiles in
via additional sysfs file would still be useful for userspace.

Will come back with the patches later, thanks!

