Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D6237180
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Aug 2026 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697461; cv=pass; b=TedpVUGfpLIKsY92L+NlT61LZjcEK/kidvPTyZaQe8BD8DQRjfFhWqUioIdD1n0IUtja2xNc11E5z5RHdR6caad8KZ8B3xfMdYWxDasFUk1RzZCwVgJkjPZF3P4wjOnpfJ+qP61d2Y4l1KoJW831jQVn+ykLahxhZTt51emb+fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697461; c=relaxed/simple;
	bh=NBxotoBk124BN0sHU4ZZgpnRDGcaqBHwam02Ui+6UTc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QHY65sXMw2sY93H9CMuN8sS6tovQ1H/dRDLBRITbi6mKC1E3KDULXOZZUFVw7IOKqXQjw3jyAtHYK6E+sy/vO4Hf4Bub7dMiK0B1rss6DDOX4pyUD/sGkW2/0S0vt/g/to2WluFQdsI60uLSpp2DYOh6m84c2SMvgQ5jPojIH98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfITsd4A; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfITsd4A"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1579693a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Aug 2026 12:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785697459; cv=none;
        d=google.com; s=arc-20260327;
        b=GqXCu1WdamDp0OdWN6MwaTcddwyqBoX+5rBXfCBqUiuxGm57LyvycKdj/9TykuDNZo
         Bjx8lQzkuDfxNVKlGsWNlIzOKwLT9inXYDu0GqRtU9Q7jmYywzoAwAdwLEJNY7HCgKi1
         D/lsxoQh+AM0z3RpBh1CiPoEl/0eNxfg7LjOiBqJIHbg3pFQgHm8bTNG+vr12FIPZxGo
         rDvzBieHjspTR5/jtY5mmaGwVVXUzRSF25fZxtkUI39FlKJtwvBlrucFSVCxejN4ET/I
         GFR0ti8Ylf/1G5yinKuGw4fOA+6ik6CF9s1R8AIewiJbzSoSrilGMWG8YbSuPV76edcj
         M/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NBxotoBk124BN0sHU4ZZgpnRDGcaqBHwam02Ui+6UTc=;
        fh=312KN5MLE4CNDLa0rABBk8e6w8Z8dpzmcWfVTwRyDbk=;
        b=OHVZ1xS7SOtn1yBKfBRr8OqJBblKbp5argyNRa4abOV2Ts2dSvd9f6hLgGFwchidjg
         N8mAoio8c7er79RpHCVp1fOl0bV9gz831zqr0tOAXesinK4VQsq3xKwqSIYsolMdhlff
         yxJThN6Ly+ZfNGk860kt/SpQ/S6+djyAuYgGp1xfTRspm3V5vn83/eltv/+N/mVvo0df
         PZeTqdU4O29HRgbouEdeva08p8loUfyyOioXGV677WiUm+fUqR/eZdWkYKuIiiel2C5h
         9qV1xVspR9/35mgy68vvFUDk2dPVooqhthrqZ7sWpWSIL9MX3d67ybRdc4X49F+gt79W
         IGYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785697459; x=1786302259; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NBxotoBk124BN0sHU4ZZgpnRDGcaqBHwam02Ui+6UTc=;
        b=CfITsd4Aaaf/bXxn62nPIi3FEFGq6ReKmzRGOCiK2j73uCrLPSrWBesKlRQqOw0B3M
         tDiL9ZpcU13vwv15S1jPdo41tdYxHBhSGTE/HxghKTHO1StWjAG7oUCx4WyluTQPVbJJ
         jzHVlwMw/hPqqZQehmR0Y6Yb9TWx8I4fcQp8jwezOojxaVciNPlbau2mUMe4xf1Yd6QC
         Ve3WFCaxpSt2jHehR9aLr2zuDOAIrn2XrEqB6qq0UvmQFn3R1xIKtH12l8SjE+tR5cMq
         0KlIRN4Hw3HngpMM16ATz7rpaf+9kEyp+QGTNnTlDLo+2Bb6/DA5ejpfORmRo7i1Xpx9
         H60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785697459; x=1786302259;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBxotoBk124BN0sHU4ZZgpnRDGcaqBHwam02Ui+6UTc=;
        b=IbJw/NRflQNQbq1wE1hXq53yM+gUQ2UeWzbLdOP3ka7IQCRbLIMYM50O39AMhRIJVc
         gOcgR5Qb34VSGy62jcly5QAsu4MCQjLt0HXyhA5Nh9uhJEbk5wyuoOHs2SIs4VrFFHqH
         c98LXUD9wYbSZhmK3e+RYejwpVpaLZMkgjytem0w4cme5IcDAgJs31P4hN31EqA+SdB8
         D8GfciDNb1CDHOTKH/qLTjHf0GD63kH+PGBhVuEGCF0ZmyDu9g3d9KECyPXJ0vhMNpK5
         UVF5F2ycZWmuxV1f/pwpDZrMJszo9HTC6H3qSY37TJTSRn2NjqtsniC/kpzk+ZBvtVlC
         YsDA==
X-Gm-Message-State: AOJu0YxRGfAV735DJkwtnEEEXK1xEo2iiSmUF3JB0BkBNx2MB36evblI
	maSxXD6EAhbZq6QwwY9Z0+pOIYQKdWIHF5bnq+PN9IeJFQmtkH50ugUtLsxBaOSfQB80PKDG66r
	iUzVv9hq5Re+arJFCdZxqiL/T+7UZPr36P3Rf
X-Gm-Gg: AR+sD12srzQjRP5E1D1LmQVUTEvSTZR1sECrwYzen4KCsNB1vYpxCXgFv29q2Vn3Pm2
	aP2HynuRyXSPgFykS1YiwFAS43N7wU1JyJR6tLwHmAK/35676Xfwv4OOVULt6u2F4+NThTGEtJm
	RRkU+QpfljraukWL8udj6qy8zIpIM+M5zgsrug3AM1aTcGsuQdREDONVQYhOawonWb1PuG6EDh8
	Xk89UppOWqYisA81JYLuTIg5l1au+qeUNHL9Ok42YGMqjHGCS3OCH56Bw370x+sBsS1waWwZa62
	SK5Z8M5SO1MxaT3HMb46kzCI8GMHVtA9G1WkSfTZXNgg5Wg1f46KWzSYYyZhbGkcyKtgIF/uVSN
	57O9BxJ20IWzIt0NOJ2lLpdlLKkO7y1mDp85dSsX0
X-Received: by 2002:a17:90a:fc46:b0:38e:b3fd:d584 with SMTP id
 98e67ed59e1d1-38fbcab0202mr5276428a91.15.1785697459276; Sun, 02 Aug 2026
 12:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kobeto zebida <kobetozebida0@gmail.com>
Date: Sun, 2 Aug 2026 22:04:08 +0300
X-Gm-Features: AUfX_mw1Jk57qHFzseCqmp7xWJd34BpZTMbfVtOs3ygRafrvSNyH2OJpCVWb2Co
Message-ID: <CABAdX2pkcpuC8PdkebmiZ7B+iNP_VN+5tWEy_DbffNOa7k6B6A@mail.gmail.com>
Subject: HP OMEN 16-am0xxx: GPU power limit stuck at 95W (needs hp-wmi cTGP unlock)
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000bca9f806581516cb"

--000000000000bca9f806581516cb
Content-Type: multipart/alternative; boundary="000000000000bca9f706581516c9"

--000000000000bca9f706581516c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

My OMEN Gaming Laptop 16-am0xxx with RTX 5060 Laptop GPU cannot reach
its full 115W power limit on Linux. It's stuck at 95W.

This appears to be the same issue reported for OMEN Max 16 models:
the hp-wmi driver needs to send the HPWMI_SET_GPU_THERMAL_MODES_QUERY
(0x22) WMI call to unlock the GPU TGP, but this board isn't in the
supported list.

nvidia-powerd starts but never negotiates Dynamic Boost =E2=80=94 it just
idles on DBus without raising the power limit.

Windows with OMEN Gaming Hub works fine (115W available).

Full logs attached.

Please CC me on any patches. I can test kernel builds.

Thanks,
Medo

--000000000000bca9f706581516c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>My OMEN Gaming Laptop 16-am0xxx with RTX 5060 L=
aptop GPU cannot reach <br>its full 115W power limit on Linux. It&#39;s stu=
ck at 95W.<br><br>This appears to be the same issue reported for OMEN Max 1=
6 models: <br>the hp-wmi driver needs to send the HPWMI_SET_GPU_THERMAL_MOD=
ES_QUERY <br>(0x22) WMI call to unlock the GPU TGP, but this board isn&#39;=
t in the <br>supported list.<br><br>nvidia-powerd starts but never negotiat=
es Dynamic Boost =E2=80=94 it just <br>idles on DBus without raising the po=
wer limit.<br><br>Windows with OMEN Gaming Hub works fine (115W available).=
<br><br>Full logs attached.<br><br>Please CC me on any patches. I can test =
kernel builds.<br><br>Thanks,<br>Medo<br><br></div>

--000000000000bca9f706581516c9--
--000000000000bca9f806581516cb
Content-Type: text/plain; charset="US-ASCII"; name="omen-bug-report.txt"
Content-Disposition: attachment; filename="omen-bug-report.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_msc64l230>
X-Attachment-Id: f_msc64l230

T01FTiBHYW1pbmcgTGFwdG9wIEdQVSBQb3dlciBMaW1pdCBCdWcKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KClN5c3RlbSBJbmZvOgpQcm9kdWN0OiBPTUVOIEdhbWluZyBM
YXB0b3AgMTYtYW0weHh4Cktlcm5lbDogNy4xLjQtMjAwLm5vYmFyYS5mYzQ0Lng4Nl82NAoKR1BV
IFBvd2VyIEluZm86Cgo9PT09PT09PT09PT09PU5WU01JIExPRz09PT09PT09PT09PT09CgpUaW1l
c3RhbXAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBTdW4g
QXVnICAyIDIxOjU4OjM0IDIwMjYKRHJpdmVyIFZlcnNpb24gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDogNTk1Ljg0CkNVREEgVmVyc2lvbiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA6IDEzLjIKCkF0dGFjaGVkIEdQVXMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IDEKR1BVIDAwMDAwMDAwOjAxOjAwLjAK
ICAgIEdQVSBQb3dlciBSZWFkaW5ncwogICAgICAgIEF2ZXJhZ2UgUG93ZXIgRHJhdyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOiAyNi4yOCBXCiAgICAgICAgSW5zdGFudGFuZW91cyBQb3dl
ciBEcmF3ICAgICAgICAgICAgICAgICAgICAgICA6IDI4LjExIFcKICAgICAgICBDdXJyZW50IFBv
d2VyIExpbWl0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogOTUuMDAgVwogICAgICAgIFJl
cXVlc3RlZCBQb3dlciBMaW1pdCAgICAgICAgICAgICAgICAgICAgICAgICAgOiBOL0EKICAgICAg
ICBEZWZhdWx0IFBvd2VyIExpbWl0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogODAuMDAg
VwogICAgICAgIE1pbiBQb3dlciBMaW1pdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
OiA1LjAwIFcKICAgICAgICBNYXggUG93ZXIgTGltaXQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDogMTE1LjAwIFcKICAgIFBvd2VyIFNhbXBsZXMKICAgICAgICBEdXJhdGlvbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTm90IEZvdW5kCiAgICAgICAgTnVt
YmVyIG9mIFNhbXBsZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IE5vdCBGb3VuZAog
ICAgICAgIE1heCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBO
b3QgRm91bmQKICAgICAgICBNaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDogTm90IEZvdW5kCiAgICAgICAgQXZnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IE5vdCBGb3VuZAogICAgR1BVIE1lbW9yeSBQb3dlciBSZWFkaW5n
cyAKICAgICAgICBBdmVyYWdlIFBvd2VyIERyYXcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDogTi9BCiAgICAgICAgSW5zdGFudGFuZW91cyBQb3dlciBEcmF3ICAgICAgICAgICAgICAgICAg
ICAgICA6IE4vQQogICAgTW9kdWxlIFBvd2VyIFJlYWRpbmdzCiAgICAgICAgQXZlcmFnZSBQb3dl
ciBEcmF3ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IE4vQQogICAgICAgIEluc3RhbnRh
bmVvdXMgUG93ZXIgRHJhdyAgICAgICAgICAgICAgICAgICAgICAgOiBOL0EKICAgICAgICBDdXJy
ZW50IFBvd2VyIExpbWl0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTi9BCiAgICAgICAg
UmVxdWVzdGVkIFBvd2VyIExpbWl0ICAgICAgICAgICAgICAgICAgICAgICAgICA6IE4vQQogICAg
ICAgIERlZmF1bHQgUG93ZXIgTGltaXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBOL0EK
ICAgICAgICBNaW4gUG93ZXIgTGltaXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDog
Ti9BCiAgICAgICAgTWF4IFBvd2VyIExpbWl0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6IE4vQQogICAgRURQcCBNdWx0aXBsaWVyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiBOL0EKCgpudmlkaWEtcG93ZXJkIHN0YXR1czoKQXVnIDAyIDE5OjMzOjA4IE9tZW5w
cm8gbnZpZGlhLXBvd2VyZFsxMTk3XTogREJ1cyBDb25uZWN0aW9uIGlzIGVzdGFibGlzaGVkCkF1
ZyAwMiAxOTozMzo0MCBPbWVucHJvIHN5c3RlbWRbMV06IFN0b3BwaW5nIG52aWRpYS1wb3dlcmQu
c2VydmljZSAtIG52aWRpYS1wb3dlcmQgc2VydmljZS4uLgpBdWcgMDIgMTk6MzM6NDAgT21lbnBy
byBudmlkaWEtcG93ZXJkWzExOTddOiBFUlJPUiEgRXJyb3IoMWYpIGluIHNldHRpbmcgdGhlIHNo
b3J0IHRpbWVzY2FsZSBsaW1pdCAoMCkKQXVnIDAyIDE5OjMzOjQwIE9tZW5wcm8gbnZpZGlhLXBv
d2VyZFsxMTk3XTogUXVpdCBzdWNjZXNzZnVsbHkKQXVnIDAyIDE5OjMzOjQwIE9tZW5wcm8gc3lz
dGVtZFsxXTogbnZpZGlhLXBvd2VyZC5zZXJ2aWNlOiBEZWFjdGl2YXRlZCBzdWNjZXNzZnVsbHku
CkF1ZyAwMiAxOTozMzo0MCBPbWVucHJvIHN5c3RlbWRbMV06IFN0b3BwZWQgbnZpZGlhLXBvd2Vy
ZC5zZXJ2aWNlIC0gbnZpZGlhLXBvd2VyZCBzZXJ2aWNlLgotLSBCb290IGZiYzFmZjQyY2M5ZjRj
Mzg5ZWEwYTA0MWU2N2EyODFhIC0tCkF1ZyAwMiAyMToxNDoyOCBPbWVucHJvIHN5c3RlbWRbMV06
IFN0YXJ0ZWQgbnZpZGlhLXBvd2VyZC5zZXJ2aWNlIC0gbnZpZGlhLXBvd2VyZCBzZXJ2aWNlLgpB
dWcgMDIgMjE6MTQ6MjggT21lbnBybyBudmlkaWEtcG93ZXJkWzExNzVdOiBudmlkaWEtcG93ZXJk
IHZlcnNpb246Mi4wIChidWlsZCAxKQpBdWcgMDIgMjE6MTQ6MjggT21lbnBybyBudmlkaWEtcG93
ZXJkWzExNzVdOiBEQnVzIENvbm5lY3Rpb24gaXMgZXN0YWJsaXNoZWQKQXVnIDAyIDIxOjIwOjQ1
IE9tZW5wcm8gc3lzdGVtZFsxXTogU3RvcHBpbmcgbnZpZGlhLXBvd2VyZC5zZXJ2aWNlIC0gbnZp
ZGlhLXBvd2VyZCBzZXJ2aWNlLi4uCkF1ZyAwMiAyMToyMDo0NSBPbWVucHJvIG52aWRpYS1wb3dl
cmRbMTE3NV06IEVSUk9SISBFcnJvcigxZikgaW4gc2V0dGluZyB0aGUgc2hvcnQgdGltZXNjYWxl
IGxpbWl0ICgwKQpBdWcgMDIgMjE6MjA6NDUgT21lbnBybyBudmlkaWEtcG93ZXJkWzExNzVdOiBR
dWl0IHN1Y2Nlc3NmdWxseQpBdWcgMDIgMjE6MjA6NDUgT21lbnBybyBzeXN0ZW1kWzFdOiBudmlk
aWEtcG93ZXJkLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KQXVnIDAyIDIxOjIw
OjQ1IE9tZW5wcm8gc3lzdGVtZFsxXTogU3RvcHBlZCBudmlkaWEtcG93ZXJkLnNlcnZpY2UgLSBu
dmlkaWEtcG93ZXJkIHNlcnZpY2UuCkF1ZyAwMiAyMToyMDo0NSBPbWVucHJvIHN5c3RlbWRbMV06
IG52aWRpYS1wb3dlcmQuc2VydmljZTogQ29uc3VtZWQgOS4yMjJzIENQVSB0aW1lIG92ZXIgNm1p
biAxNy4xNjhzIHdhbGwgY2xvY2sgdGltZSwgOC4yTSBtZW1vcnkgcGVhay4KLS0gQm9vdCBmYWUz
MmFlNWE5Y2M0YzBmYjRhYTlmN2RkZmYwZmNjNSAtLQpBdWcgMDIgMjE6MjI6MzMgT21lbnBybyBz
eXN0ZW1kWzFdOiBTdGFydGVkIG52aWRpYS1wb3dlcmQuc2VydmljZSAtIG52aWRpYS1wb3dlcmQg
c2VydmljZS4KQXVnIDAyIDIxOjIyOjMzIE9tZW5wcm8gbnZpZGlhLXBvd2VyZFsxMTg4XTogbnZp
ZGlhLXBvd2VyZCB2ZXJzaW9uOjIuMCAoYnVpbGQgMSkKQXVnIDAyIDIxOjIyOjMzIE9tZW5wcm8g
bnZpZGlhLXBvd2VyZFsxMTg4XTogREJ1cyBDb25uZWN0aW9uIGlzIGVzdGFibGlzaGVkCgpudmlk
aWEtc21pOgpTdW4gQXVnICAyIDIxOjU4OjQxIDIwMjYgICAgICAgCistLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsKfCBOVklESUEtU01JIDU5NS44NCAgICAgICAgICAgICAgICAgRHJp
dmVyIFZlcnNpb246IDU5NS44NCAgICAgICAgIENVREEgVmVyc2lvbjogMTMuMiAgICAgfAorLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCnwgR1BVICBOYW1lICAgICAgICAgICAgICAg
ICBQZXJzaXN0ZW5jZS1NIHwgQnVzLUlkICAgICAgICAgIERpc3AuQSB8IFZvbGF0aWxlIFVuY29y
ci4gRUNDIHwKfCBGYW4gIFRlbXAgICBQZXJmICAgICAgICAgIFB3cjpVc2FnZS9DYXAgfCAgICAg
ICAgICAgTWVtb3J5LVVzYWdlIHwgR1BVLVV0aWwgIENvbXB1dGUgTS4gfAp8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgIE1JRyBNLiB8Cnw9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT09PT0rPT09PT09PT09PT09PT09PT09PT09PXwK
fCAgIDAgIE5WSURJQSBHZUZvcmNlIFJUWCA1MDYwIC4uLiAgICBPZmYgfCAgIDAwMDAwMDAwOjAx
OjAwLjAgIE9uIHwgICAgICAgICAgICAgICAgICBOL0EgfAp8IE4vQSAgIDM5QyAgICBQNCAgICAg
ICAgICAgICAyNlcgLyAgIDk1VyB8ICAgIDU0MDJNaUIgLyAgIDgxNTFNaUIgfCAgICAgMTAlICAg
ICAgRGVmYXVsdCB8CnwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgTi9BIHwKKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwoKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tKwp8IFByb2Nlc3NlczogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgIEdQVSAgIEdJICAgQ0kg
ICAgICAgICAgICAgIFBJRCAgIFR5cGUgICBQcm9jZXNzIG5hbWUgICAgICAgICAgICAgICAgICAg
ICAgICBHUFUgTWVtb3J5IHwKfCAgICAgICAgSUQgICBJRCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVzYWdlICAgICAgfAp8PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT18CnwgICAgMCAgIE4vQSAgTi9BICAgICAgICAg
ICAgMTgwNyAgICBDK0cgICAvdXNyL2Jpbi9rd2luX3dheWxhbmQgICAgICAgICAgICAgICAgICAg
IDY2TWlCIHwKfCAgICAwICAgTi9BICBOL0EgICAgICAgICAgICAxOTAzICAgICAgRyAgIC91c3Iv
YmluL3BsYXNtYS1rZXlib2FyZCAgICAgICAgICAgICAgICAxMjdNaUIgfAp8ICAgIDAgICBOL0Eg
IE4vQSAgICAgICAgICAgIDE5NzMgICAgICBHICAgL3Vzci9iaW4vWHdheWxhbmQgICAgICAgICAg
ICAgICAgICAgICAgICAgMk1pQiB8CnwgICAgMCAgIE4vQSAgTi9BICAgICAgICAgICAgMjAyNiAg
ICAgIEcgICAvdXNyL2Jpbi9wbGFzbWFzaGVsbCAgICAgICAgICAgICAgICAgICAgMTAzTWlCIHwK
fCAgICAwICAgTi9BICBOL0EgICAgICAgICAgICA3NDgxICAgICAgRyAgIC4uLnNoYXJlL1N0ZWFt
L3VidW50dTEyXzMyL3N0ZWFtICAgICAgICAgIDNNaUIgfAp8ICAgIDAgICBOL0EgIE4vQSAgICAg
ICAgICAgIDc3NjAgICAgICBHICAgLi9zdGVhbXdlYmhlbHBlciAgICAgICAgICAgICAgICAgICAg
ICAgICA1OE1pQiB8CnwgICAgMCAgIE4vQSAgTi9BICAgICAgICAgICAgNzc5MiAgICAgIEcgICAu
Li5hbS91YnVudHUxMl82NC9zdGVhbXdlYmhlbHBlciAgICAgICAgMzkyTWlCIHwKfCAgICAwICAg
Ti9BICBOL0EgICAgICAgICAgICA5MDQ4ICAgICAgRyAgIEM6XHdpbmRvd3Ncc3lzdGVtMzJcZXhw
bG9yZXIuZXhlICAgICAgICAgIDJNaUIgfAp8ICAgIDAgICBOL0EgIE4vQSAgICAgICAgICAgIDkw
NzQgICAgQytHICAgLi4ua1xnYW1lXGJpblx3aW42NFxkZWFkbG9jay5leGUgICAgICAgNDIzOU1p
QiB8CnwgICAgMCAgIE4vQSAgTi9BICAgICAgICAgICAgOTY3MSAgICAgIEcgICBraXR0eSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA0TWlCIHwKKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKwo=
--000000000000bca9f806581516cb--
