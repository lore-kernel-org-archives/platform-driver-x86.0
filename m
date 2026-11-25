Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592505;
	b=ViyRDwGFCVQoe3gt9mn8JqhYbB76M2CcbJO3NBXn9qBQ41fR8jCqwCCkO371oUsXsorh
	 xXAivGIpGHGCuvLwlj2wWfO+tJJ6DDIxvlv2aBo6TSYMfLUNskg51LPJ+HV37l8mftfS2
	 j++QTyBwJHkxasWuUMaaomubLH5GIRMNpeXQWZIUEFN7myMibJNbJSgKHMMhNOMSF2N5E
	 sf4+R8aVojuwj0Y1n9OYpYJaf7MZZzpVYkFWEBAowlhUJlnfYP6HHjTxN8wmV3ZQ3uxps
	 ndP9hhLhypSStUl9+T6TzBT2xLrRtwDGPJl8BtLfLS0Lf5NedIaquXnu0x9I5y0MU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592505;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=v7Af5kyLjyd57eXzMOWlzKezBBqvzAGbw4YXHx+soII=;
	b=o14BFy7JOfhRWQjpeMCy0Sk40OHVV62LcXCR8yVOolhGJ0gk4AIN8e7MKlW3juCOiK7t
	 cFs2ODlorDj1UJZS7wfkarwNmp24i8gsTV3i4o+dHNTo7sc6DUJV7flV7FgRV3Cqf15a8
	 JeU6q/8PrTsTQGagOG4WEYxMAjZ7MY9IbcbyMczvTvE57v6gBtIo1dI7xJTBmgYePL6VC
	 qTBiHJN4X1K8WYlcjfQnwg8yJ1IeYoGozjf3efRkGQWATTssgYvrKruU9RWQuOL/KRIko
	 39TXAlB7P3gBs6VWKkffkxLFbn7k19VeJBIP7gqPuABXiZtzK/kSNLT0W2M0SsEWUTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=sy49Ax0U;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19796606A31E;
	Wed, 25 Nov 2026 07:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19796606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=sy49Ax0U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795592465;
	bh=v7Af5kyLjyd57eXzMOWlzKezBBqvzAGbw4YXHx+soII=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sy49Ax0UuCdKhGRdbbqNy0O3b0pEYlXTiKH6zF5lOrRLWyU0NVMlAfyuMmJd0pGDM
	 S3pvcgBjLsmnbYqpxk3M+zu+lewkZMWoRuHxxR/RosdEm4QMVLF6Q/zCeexMg0mlcr
	 Jry5433fVbvwNXUmtqkqGhIsR6fPzYbA2eVhIL4c=
X-QQ-mid: zesmtpgz3t1795592456t30fdd3f6
X-QQ-Originating-IP: RZcLAf6M8hNp/UOKkyyuqcOf1oo2B6Y9ue1s/CdfF8s=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.242])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 15:40:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8071275655235200260
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: erenozen@protonmail.com
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhshzh0@gmail.com
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 15:40:44 +0800
Message-ID: <CCE496207C6C15CE+20261125074048.50842-1-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <hCsVvRfdJna6QMofi0p51idPd_JLLislzGzqFjePf9_91ayfS92LIselCT-narFk2u5zTRqLQsKFnz4bgRrNmjY5EKgq9UYj0n_CfmaCJjs=@protonmail.com>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn> <hCsVvRfdJna6QMofi0p51idPd_JLLislzGzqFjePf9_91ayfS92LIselCT-narFk2u5zTRqLQsKFnz4bgRrNmjY5EKgq9UYj0n_CfmaCJjs=@protonmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqgmE/hXVl+ugpZXbuS6VYozec/P+R6gW8vbeOAudaWTmI63YjsHnA6x
	zNAhFdfKC7Nz2QdPp9i3LeECn9vbcm1393M3XlQ4a0C3faIuUni6K0mbi/i/Jra+i9FSwLG
	EpTjiFnt+Z4eMBsmZqtySghtrtBE2KBQJwyAZCftOTUmAx/sx8wgZlMz3/jbVl5yAzy/3uz
	FTVGCOw8i5P+TG5VNl0Pw+im2dWErSYOmrG5XSy+NJvkrl3qWcmsf25zU2oCIzUG8xAHdO3
	JJWFoU3THly8oJKb+WETufkM9igAnh9m63W69ILtLilZwkYlrp4tRuha3odAnprzH2Bcp8F
	BBXqjOacl+eAsUwIyD0SVNLF66U8P2s6SmmO0lSYCbwKVpeUp4tJBoxi5C36/80nUQ/cE51
	1CmCPHVSc4BuBzrn2/blOMKirKG4/T7U3zHAg8RNuDvsr4rnUc+ypWpRhUAQnEm9PVbrnkK
	CuxvFsIhO9D8lL2lqYPdL343Tl/IQwmzBx//BELF/bl2mSTyZjX/pLLds0QboOVWXoj4rEX
	MLQ0HZ7e4UK2tfKAyz2sHjxRS+1/iRi2l8Ar9SB/LWbUKpP1cgXLq+yuon7T1bS0lXCb4QL
	jLqxTvOiVLsInJTkBZvtgryQs9ULxvkQx0PNcQw8Sc0CuhzUisQbKNboufhSvruo61NgsfY
	dLoc4Rpz1jAbgwcb/ynWxrSAGfzmuo8IuN2dQit1oqJUjm4V8bRzGlR5gbu0Hy4dLeuUGza
	Ya9q45Y1RChm4uCo2+vWlpWilp+xisCB5CJqJWAUhJbRo6c/SMuATNfCrHEclwNWFlItOB9
	n1fliVSRJYHvkXrOPb2OQ1rRAylvkEYfgTXqZeExsleESG3pmXXwDNMhkfo/6UzI/brETza
	6bRobzH58WzrHOq/x/zfbelQp046soWsqRpjffA8h//60SSyiLbL4LqX4alhBByWbeizMOX
	ver5PD7OfYSlQcvDXorWwjXy6uRrO1/5mzSZlVMMzcBzKcX5DcyYl02dIJLGd3Cu09Y1wKN
	5ZDxJ5zpn/FcEt3Tbv2zr4wIKdPJ+jf7f0PirXKAdRxkcnxNtE6eF63yba1kiUJz5Umupq4
	rV8uSYVpTkgL7juydGj0iBr30RDpwxI3t+Q8FiNE8QU/RfqToOWHAA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi Eren,

Resending in plain text since the lists rejected my previous reply.

Thanks for trying this out and for catching the silent fallback to
\SBTT. I'd appreciate a copy of the diff you tested.

Ilpo, taking Eren's charge-mode fix first works for me. Once it lands,
I'll rebase my series on top and use Eren's diff to cross-check the
charge-mode changes.

Thanks,
Fuwei
