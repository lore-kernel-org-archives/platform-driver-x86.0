Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB02D1F7B;
	Sat, 17 Oct 2026 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223004; cv=none; b=kPn7CxiwdQ4h3gsEE51o+MaDiiGO5T+g9+6Shcki8KpsmswIL3Ip1en71sEzNdKaoK2xwZU05CxnEYgxdTU1mPJAi5NlEngE3soDaWZW0u3FzUhSw0kK5Q+CghebpbTt4fnVYfNoSgIVOmTpA+w+o5fURe0KSzfIFy8vybQfBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223004; c=relaxed/simple;
	bh=aITy8/oKYjGUM8gs6l4kz+Yrd0C97hAR7Fety0ZnMFo=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=tp2bgwyP0riJJWyCRiSYTQfOz2gqIci+WmYArGSTD/LX9J/xKIstz+XX51KrZxkfE+05HoSnH0L8zwtT0WVB3FdptWXn4hHFqINXcjX2b89doyOZLatRq8H6CUjp6Gs5RZDD0iVUkmnls2sNSAvCidBI9r4ieP98AulDQAz3Zxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Amh5sJCi; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Amh5sJCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=aITy8/oKYjGUM8gs6l4kz+Yrd0C97hAR7Fety0ZnMFo=; b=A
	mh5sJCiZETnejrXgilx9n3f8ux1jpSjI8ZuqOc0Riw1S0jR9iYiEm/jaTl23YSXY
	/7De9XC9D+Oz2gvXlZemL1dMq1jsVV//6M3ZNxtnIPpVrRCb96R7XYFu18RvDndt
	sd7FjHFFgJ2AWuu2MzMBblXkO7wteVhGAqxhlaTZ/k=
Date: Sat, 17 Oct 2026 15:42:57 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Herton Ronaldo Krzesinski" <herton@canonical.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v3 2/3] platform/x86: topstar-laptop: Check
 ACPI_COMPANION() against NULL
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261017064350.3817228-1-yaojiale02@163.com>
References: <20261017064350.3817228-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUEs4SWRZ+kdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH+lW6/SuJRm3AkjP5JI2rpw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <12cb3ffb.191b.1a148d05e4a.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgA3dzsBJ9NqevxaAA--.143W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQFZk2rTJwE1cgAA3e
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNyAxNDo0Mzo1MCwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5BZGQgYSByZXF1aXNpdGUgQUNQSV9DT01QQU5JT04oKSBjaGVjayBhZ2FpbnN0IE5V
TEwgdG8gdGhlCj50b3BzdGFyLWxhcHRvcCBkcml2ZXIsIGFsaWduaW5nIHdpdGggdGhlIGZpeCBh
cHBsaWVkIHRvCj5hc3VzLXdpcmVsZXNzIGRyaXZlci4KPgoKRml4ZXM6IDM0NzE0MTVjODE4NiAo
InBsYXRmb3JtL3g4NjogdG9wc3Rhci1sYXB0b3A6IENvbnZlcnQgQUNQSSBkcml2ZXIgdG8gYSBw
bGF0Zm9ybSBvbmUiKQoKPkFzc2lzdGVkLWJ5OiBjbGF1ZGU6ZGVlcHNlZWstdjQtcHJvCj5TaWdu
ZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMv
cGxhdGZvcm0veDg2L3RvcHN0YXItbGFwdG9wLmMgfCAzICsrKwo+IDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RvcHN0
YXItbGFwdG9wLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni90b3BzdGFyLWxhcHRvcC5jCj5pbmRl
eCBlMDlkN2Y4Y2U0NWYuLmY2ZmFmYTM0NWY5MyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L3RvcHN0YXItbGFwdG9wLmMKPisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RvcHN0
YXItbGFwdG9wLmMKPkBAIC0yOTEsNiArMjkxLDkgQEAgc3RhdGljIGludCB0b3BzdGFyX2FjcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAJc3RydWN0IHRvcHN0YXJfbGFw
dG9wICp0b3BzdGFyOwo+IAlpbnQgZXJyOwo+IAo+KwlpZiAoIWRldmljZSkKPisJCXJldHVybiAt
RU5PREVWOwo+Kwo+IAlkbWlfY2hlY2tfc3lzdGVtKHRvcHN0YXJfZG1pX2lkcyk7Cj4gCj4gCXRv
cHN0YXIgPSBremFsbG9jX29iaihzdHJ1Y3QgdG9wc3Rhcl9sYXB0b3ApOwo+LS0gCj4yLjM0LjEK

