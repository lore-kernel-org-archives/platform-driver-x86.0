Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB622DCF74
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100921; cv=pass; b=eVEcfPCWg4WdviKeq3iBIC0DbjBTSe+AXZqYrtGJoGiTiUnj/CzySgJKc3MQII8z/99bj/D43j7hw8rDOhvkq6oOPai85Cqa4N9H4fljaR/tE/Ymb3IGmfkVcKovua7N86/non3ny76F6Z4rgyWyoKVVHyApVCQuor9xKbthpfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100921; c=relaxed/simple;
	bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOco0eVOirNcUzDX9Np3CeQ35U81pY8riXfScpcjKnuspKumTz2RpwJQOQ8ZMEvbW039NT16D8g8PRvznVn59UZVHz08dxpCYMKq5QbE9iMJRFdnipW15j4HaEsXMPTbAaAOg8Z3YUFDTuJo+6fdNAdL7aIPZExO8AYZrZzrJ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXBURXWr; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXBURXWr"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-938cd95b06eso216114585a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788100919; cv=none;
        d=google.com; s=arc-20260327;
        b=g0Jva2MiW9h8/dZx4vDAhGKtRL8O/Qto8uADublKjPLKvTPd7A9yXpOUOcXq4NEvIu
         txPjhqvLEcr683a3zpQG27ZdASHm3ZSlsGmEWujr5neUgLlNg2ekl9+1rKOse64QpcZn
         QDDaTKiXwNyTTh+aBEc/usWbgPZV8dwlNLLKxfsWs3+ayItRl1uY3co/LVKNZIioqnDo
         KxANZIaKDsiVSo7mt4fQtieGdQlaRGDjHjDa4Mz1n7Xws2hNnrlO1xk7wnYFpQ8b+VM0
         iwb4+9DbAfZXgE3z3EJaCYRnS0Nt0D4tF8a6mlLkx97EWW0QHseae7hpMCxuPGWbpjQf
         KHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        fh=ItqjbCH57n7auGwuvYpFLTswBGFVcy3S/w2rKk8HAXQ=;
        b=H4G46k0J9YaN+7AzjMdGIAVRx7cHVDtU7YWUj44o2BwpZGoTpcPvro3iWDaw5yMnps
         rKnIj2zCNE7OFrAoOtJJyfCDl/QcUoQOs0nK8iENpP9/TkfgtsTMUFPBVMOsfj37GKk4
         BpEx9U+LYJKeOFSKzS3Zw5GvHvuELvV2E9KqL4QKBEzxtLmZG6gG1wgPwpuO//CMTyBV
         Guz/HXXREwsI3rRUOTxOJMLzqJ7isTsnOE8BMW9BidYCmDIqnKzqnWCUcf1+1vl3H1/9
         8tSq+WRGVPCBxQO5EXKZIiZ0n9Tiif+8TAtbD+/G/rHMuN7QsDUxNMcHzqm0dPv+gpWh
         Zqpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788100919; x=1788705719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=lXBURXWrf4b79f5nrkWuaWt/bQy4YBTe9qdOGvStNheZXm1l3O4r4dq4v1GJ92tH48
         3aVjqCenfXsOvuHfeaZ3b7TXi2tSmz/mjgOsFGn5qDlwnbz265Ov+kCCX4n3QoNf5qpJ
         b/GUyzyUFy3UcHMprvrb/KKjenhVCiVRWPOWAivkz2+i7zNIWlSE20cTaiyvGmXsuil+
         z3B6uQAHokmGq4T7Iv7w24rEbqIDC5E6DYBk21e3qjWksqCx7v0wemNY7G+DPCdvGUGe
         1pGsKO0qFSxEiqQAUZFJ3zLQ4yvjJnqu5bMAj9wLhJPb4GUw2PySCFWtQQCG5ZAAPUBw
         idOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788100919; x=1788705719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EKpfNX509NAcA59LbrSCuzxDKgr6ESuiyJW4nYMZtE=;
        b=F2OZk5JgpwTYxdMDSS7kJbcv0OC4cWaP8wRugoKuop3fp+5ypLYuTVm56QaWeLAxwb
         krh1MwYe6YVKqVV8jUDgbdgM6ATk+XJh2AcB/JiO9ekNTaMDcyjb5O+NyUFe9Ts6sZht
         NqYMtjcKZK7Vax6S3XyhXkRsKxnJktqXOocUGIEACOJqwVdujam3syQGDk0ylCklehAA
         cwk0yAUohAJZEX5Tn2LXZQbZWWyGuRd7Bw78NFImFqLwmgK7UNx76SkFexuqmy4LVRpm
         /KxeVNEcbCzOml4xdJJNUoX2EoAcTi9HioOWX+W2rDeg3VzuZg30TfzN2BtVsnMk1uJJ
         IWvA==
X-Forwarded-Encrypted: i=1; AHgh+Rrate6cjPEMuojfZlzKCJ4csLTcHcEo5NUs44g2jbUkpZkpws0aV/B7VJDZWV6JBDLUs8GmpiNLKU/YbO443xlNtKOx@vger.kernel.org
X-Gm-Message-State: AFuF++kRmzJiSZiGQVP9kBt3wByISYEL/SFScThCJsbEwW0RRbAHSzjW
	qMhNr6hvl3gTHlyI1PdAU37tn3kreb3W+gZnSwpYCsMvpnKcOVyI0OKi4sxknVeMbtI9sZTjDkH
	IPXbAbpe1OyOnPhDH6YUev+LS63GMUOA=
X-Gm-Gg: AR+sD10teQSll2zXVj4Q8Je4V8480WFYai9ewxPA4ic80k5JQUdIyaYJuR/p2+fOBNh
	QFYL3eYFwJ2jijeRRvL5x7J6rbpqPtgSFSw+IbjKKf1bkDE9DwpvYJYld5TLNCLZxjQ3oB6qiiE
	fA5pZ5I0IbmCBc+O92RGFpR2OpGSjJEbsbcdwHKnZz7BKyXHwxf+VoZUPU6+GFnYBWTc8dCS9FF
	V9euveZmdLZ6IGbp3TKvvGiegWtNQYmXRB8L/cRV8iUyhMXR91K9cUl6Fojm9NbOxsYS9Rppec1
	Jaf0gffQbtz3iwICdMUcoJp4LW+CZePnZCMJqmPyFDo3oF4UEWEdIdt0K5atEnHP
X-Received: by 2002:a05:620a:2991:b0:936:af34:468e with SMTP id
 af79cd13be357-93936bcb3admr243073685a.4.1788100919120; Sun, 30 Aug 2026
 07:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan> <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
 <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
In-Reply-To: <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
From: Mo Jun <royclark086@gmail.com>
Date: Sun, 30 Aug 2026 22:41:46 +0800
X-Gm-Features: AcwNN1WQigLhzHYMImI_yaaj0penJs2Fw872JT4mNKejiAeGOR1zlQRiow_gi2k
Message-ID: <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler directly")
To: Armin Wolf <W_Armin@gmx.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Denis Benato <denis.benato@linux.dev>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000001b75af065a44b030"

--0000000000001b75af065a44b030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin Wolf,

On Sun, Aug 30, 2026 at 9:26=E2=80=AFPM Mo Jun <royclark086@gmail.com> wrot=
e:
>
> Hi Armin Wolf,
>
> On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
> >
>> [...]
> >
> > I think i found the culprit, could you please test the attached patch?
>
> Build the module with the patch(only "make -C .
> M=3Ddrivers/platform/x86") and load the built
> drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.

I found that after rmmod the built module, it can not be insmod again.
Also the system experienced NULL pointer dereferences in
acpi_bus_generate_netlink_event() which may related to the built
module.

I guess these was caused that the patch only change calling to
acpi_dev_install_notify_handler(), not
acpi_dev_remove_notify_handler().
After change ACPI_DEVICE_NOTIFY to ACPI_ALL_NOTIFY in calling to
acpi_dev_remove_notify_handler()(see attached patch), now the module
can be insmod again after once rmmod.

Regards,
Jun MO

--0000000000001b75af065a44b030
Content-Type: application/x-patch; name="asus-laptop.patch"
Content-Disposition: attachment; filename="asus-laptop.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtfwyujb0>
X-Attachment-Id: f_mtfwyujb0

LS0tIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtbGFwdG9wLmMub3JpZwkyMDI2LTA4LTI4IDE0
OjI1OjIyLjAwMDAwMDAwMCArMDgwMAorKysgZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1sYXB0
b3AuYwkyMDI2LTA4LTMwIDIyOjIwOjUxLjQ3ODU2NTg2MSArMDgwMApAQCAtMTg4Nyw3ICsxODg3
LDcgQEAKIAlpZiAocmVzdWx0ICYmIHJlc3VsdCAhPSAtRU5PREVWKQogCQlnb3RvIGZhaWxfcGVn
YV9yZmtpbGw7CiAKLQlyZXN1bHQgPSBhY3BpX2Rldl9pbnN0YWxsX25vdGlmeV9oYW5kbGVyKGRl
dmljZSwgQUNQSV9ERVZJQ0VfTk9USUZZLAorCXJlc3VsdCA9IGFjcGlfZGV2X2luc3RhbGxfbm90
aWZ5X2hhbmRsZXIoZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJCQkgYXN1c19hY3BpX25v
dGlmeSwgYXN1cyk7CiAJaWYgKHJlc3VsdCkKIAkJZ290byBmYWlsX3BlZ2FfcmZraWxsOwpAQCAt
MTkxNyw3ICsxOTE3LDcgQEAKIHsKIAlzdHJ1Y3QgYXN1c19sYXB0b3AgKmFzdXMgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCWFjcGlfZGV2X3JlbW92ZV9ub3RpZnlfaGFuZGxlcihh
c3VzLT5kZXZpY2UsIEFDUElfREVWSUNFX05PVElGWSwKKwlhY3BpX2Rldl9yZW1vdmVfbm90aWZ5
X2hhbmRsZXIoYXN1cy0+ZGV2aWNlLCBBQ1BJX0FMTF9OT1RJRlksCiAJCQkJICAgICAgIGFzdXNf
YWNwaV9ub3RpZnkpOwogCWFzdXNfYmFja2xpZ2h0X2V4aXQoYXN1cyk7CiAJYXN1c19yZmtpbGxf
ZXhpdChhc3VzKTsK
--0000000000001b75af065a44b030--
