Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432664;
	b=vz06NFl68o2ajlKlve5tpt3BpGVcKVpn2opFn2AReimldjJfhOq8NE50GajlGfKDr6x1
	 /AaSUA4NEf9sD7xvuNBGq93wfcGVkHjDMuF0AkLtkryusbYMD6Uvper0ljHVWxTf1yfae
	 MLhv3VJL6I/H2rjVB/3356HsZnLQU8hxF1XtbyEql/GNLfWu/BFcy2+ObldLTjsjYNI9x
	 jh+014Uk4Egg/zpHeUwmBZv9DEMT2wvBvErqFfSGd3RTi1dZwwfwB40MTYUwltN5Ft68D
	 kicGKcYlPRn+D83iaKbvk85mP6x9psHdQ+Of05DoUpuOOqQ/pRdSekkSm+2YE8YC+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432664;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=klaQy1bveJlQSFPbSc3iT3gR1ryQc0zeaqAPg1XeAf8=;
	b=TyoIcavTjZMQfIIJSmnUc+/Jtq+wyqUBjsX5DwYBPimLizmeQ8wYdMUkQNPPsI1ecnQZ
	 UdCqYqhxmza1pUs1np2g28A3Vg5hkWWJ7v8O+4v6ygNI6QKbUg5qPcF/XB05f/T3h7zuE
	 VgM7uf7nsunalrtFDgVwYB67v9ncjQjjvwUK84+4rDiq8edsfb3DpcD2F+IsIePkhzVw1
	 PD2s+1POrS64BQemjf9YgtqsycUg5ikJQeHPOBkSO/WhnnuvY0PY81ncJslKqOVmdz7oe
	 e7udHPeLpKzeKp1WRekDF9XqlnDbrdWkjfcd9q1r5MGItOKvF0q6uNEVXcD0ctcmgzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=kNX1gKB7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QDwhmz9v;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F3606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 17:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=kNX1gKB7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QDwhmz9v
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D997EC019D
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 13:57:41 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 13:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792432660;
	 x=1792519060; bh=klaQy1bveJlQSFPbSc3iT3gR1ryQc0zeaqAPg1XeAf8=; b=
	kNX1gKB7aX0aICg2xTMrqn62mOafZOtLCZa6SOoyuKbO9OOiZVgpUfPFjjgaU12L
	oMQDjHwQGIbVit22f7E8UPsSC7okrfYrtVPgQpj3u18Nfewsl+JKvgfd89BMqcrx
	sSDgvnKbq+ihq2skB9OQntPc+SnvOrVujnUnEcj51eCGfgAcrCRDsvNuOqglRm5A
	6JRv1eXucx/gx+iU8xfbtal55skdLNqKOdY9zf8CqmLBKegRX+8V2vG7EQ4LnV0d
	9PtterY2CcGyiFYBukrUUamhtmdn4dcU0Up0PXxHuSjjbQmvCN/WGnyMi7mtAZaE
	yuVkhq5aGm/c0skGQ/yqkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792432660; x=
	1792519060; bh=klaQy1bveJlQSFPbSc3iT3gR1ryQc0zeaqAPg1XeAf8=; b=Q
	Dwhmz9vJE4qQvfXGmQPS+U24Z504O/xGdfp1jhIBRJjD0CNkHJMmpTlanoeG8IeC
	17pKMggUf1uZ2pLrjxhn62VK++ekmGu+Ob4GZYiqW9UDL/a7RjOSIJTAL6LvCXwh
	lgGx9JCYG8Vxg4XJBQPHLpRfYXKmN+Z6lTQ5r3mlhPmADyiUeuDamJFvhYugouyx
	5tBY0w6JwRTXAv4iywv/GJO1hju5Hv4n9UAon3iKZnEMR3JpjqytHWLN7qJCB6Bz
	UbYf3+SFsD2EdcXd0qTvLwX1rGgaFwtTW61VK7zdc1w/Te+4B+VevXBgnBlnp2Cr
	l35bm8iXY2KNK7ACWkGqg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792432660; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:SRxEjzGyORoblqRYecvRAIvz0neTMuza6hisjXl0eeC1QgV
	Bv7MKb+5I4yfoHjRhgmxM3yD9bv+ZiCJ2x6V4yintcZ30EBM9RIJLRJSUwpmX0uf
	vivJ/kPEXpGliu1XPDXAw9+0s7MWNfMP3OMGMaNIaAchG8BAdmcHkkRnhZQVP2w6
	mF+Gh4FVIkbeu0ab9vqyq/1GWFOYHSWkm+YcbsXlHibT1+6T/sraFPQNYRvpzOJX
	Db0MmXQ5S7JwpA50zotSS0sXOT62CzZCra7UWMIv8PxBxjZFVYwC8hTDhz8hPKEr
	5Ax5xw6DwOCpsPXysK7wmLHdGxsROZx9/eiCsSA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/WLBt5JK8MN2d1iwk78z+bArAzucRYkO3chfFW0WMVM=:DHgRAuXPaRE35KS2BAYEFQAxPfD24r9rWw8xOyryQKQ=;
X-ME-Sender: <xms:E1rWagYzeAyH-EabLIXEuwUGix5russ1HYzFesW7_Zmeu0uaYdcGVw>
    <xme:E1rWamPxG2atj6N1vrT49ISKi8Kc_dqF3xA2QGqGSO3MCV_W5ZtFJQywBGeOOBjtd
    _I3_-dBx6CVZHdg_OCjDx6UB7ieH-uAZY9KXeEMLMZ0Ukkcb3YlsGXD>
X-ME-Proxy-Cause: dmFkZTGht9BpNymv21TBtrWfAD5TfZsfOsWgImMk+SylH6tTv73yIvdD4yYgwWqO/vEPk0
    BsE6rqnGduuCgSgzoFR5P7kwqLIb2pbii4r3AaP7A4tZzJYHaWcJxMeKxkz5PVnS16S12k
    FVJfbO2hwRdIJTOZVjXmNn51p/BNHNs02pjMzzGYkttrdchzqcSYxAlq8Y/KGZfFFq6SYY
    c+jhykL3s4enBWC+EQG8aenObU85ljqX5b9s14X7d8kGNaEiryY1OaLYohY7zJ7CBX8yEh
    mvli0jQDvhQN3cEFiMsClXL8gp01ZU2Z7MEVIJFXCA0iGFAq06h9fFHoDNmtlgRPWle9Pz
    sg3AGsLFNhcubqBWI+tF7/RCIBKp/GGaj8pQGGtOLtXFJrIO8L/4B/fiUXQQOpuufufp/n
    fcEOUNSQlaXWN9nW79ERIR97RGFAirTfzVjHsRJYI8oHHAHFFnnLEyE72ru/FRJqsY2KOR
    7Sv2ke2UWh6AVMjvQ/fsRjZnCzvRoKRkH/8CnFiN+7TkBmHu5dCQQXc9lY3yjv9J7G4beP
    /xDQGe9YXKRPeCDDuo8IPVBDzOsANeQPYy7NUpDAhAjllFQ+BWdbmD49meF5TUwSuA9/0b
    +hb6dyFG1BptX3izMgl2n08RUFiEIpp+D6gJoHK57FwJMexyjfEcSupq1JjA
X-ME-Proxy: <xmx:FFrWavMIbf5piNHsGaTt46V-uvQMv60c0XcjEnk19gV9cN3fn4rsnw>
    <xmx:FFrWatpi7DvE75XTn0AvJYmjK1psCAGAE-YTOpwdbs_LTowQpqiqpQ>
    <xmx:FFrWaoFNMVrtfI0kJUdvK-k9dek7PGQYq_cmIRYAPwbIf8H7Mi7KJQ>
    <xmx:FFrWaqpVeed9SZdQ11sEooQbP4cjwHiQvQGx9EUuNkemngvRoCcIKQ>
    <xmx:FFrWancCd48_DJHBnF6umUq9g2XS-49mmJGuVsnobuyfYp0yzzvC1K0g>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id CB1712C0007E; Mon, 19 Oct 2026 13:57:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AfmxGjlEtN0N
Date: Mon, 19 Oct 2026 13:57:19 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Karlos Abel" <kabel@voidship.net>,
 "Mathias Nyman" <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Cc: "Xi Pardee" <xi.pardee@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <4eda13ac-b441-4d25-98e0-4a5ad43f655f@app.fastmail.com>
In-Reply-To: 
 <CANDoYxu94VsX-_Sfzj-pk4Xjfg-oZo_5=L806DHnw786oQD9JQ@mail.gmail.com>
References: 
 <CANDoYxu94VsX-_Sfzj-pk4Xjfg-oZo_5=L806DHnw786oQD9JQ@mail.gmail.com>
Subject: Re: [BUG] xhci Intel 8086:777d: Bluetooth active disconnect leaves USB2 PLL
 on; isolated U3 prevents it
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Karlos,

On Sun, Oct 18, 2026, at 1:57 PM, Karlos Abel wrote:
> On a ThinkPad T14 Gen 6, turning off the platform Bluetooth rfkill swi=
tch
> while its USB link is active leaves PMC0:USB2_PLL_OFF_STS at 0 after t=
he
> xHCI controller runtime-suspends. Suspending the USB device before the
> same radio-off operation leaves the status at 1. Earlier installed-ker=
nel
> tests associated these conditions with failed and successful S0ix entr=
y.
>
> I have narrowed the difference to hardware link suspension, independen=
tly
> of Linux's normal USB-device suspend bookkeeping. I am asking for guid=
ance
> on the controller/platform mechanism before proposing a kernel fix.
>
> Hardware and software:
>   Lenovo ThinkPad T14 Gen 6, type 21QDS3DH00
>   Core Ultra 7 255U; BIOS N4JET28W (1.18), dated 2026-06-16
>   xHCI 0000:00:14.0, PCI 8086:777d, xHCI version 1.20
>   Bluetooth USB 8087:0033, full-speed (12 Mbps), root port 10 / USB 3-=
10
>   Bluetooth firmware intel/ibt-0093-0041.sfi
>   Active-versus-normal-suspend failure reproduced on stock 7.2.7-arch1=
-1
>   Latest isolation test: 7.2.7-arch1-bzlink1, a local diagnostic build
>   This report does not claim a hardware test of current mainline.
>
> A source comparison on 2026-10-18 against stable 7.2.11 and mainline
> 32c52ec87d6245ee2d12ed5dd509e40062939b50 found no matching clock-relea=
se fix
> in the reviewed USB/xHCI, Bluetooth, rfkill, ACPI, and PMC paths. Main=
line
> does contain newer endpoint-recovery prevention after disconnect, incl=
uding
> 042aad8d0db6 and 7e0ef4332ed9. In the captured radio-off-to-clock-samp=
le
> intervals, however, the only traced xHCI command is Disable Slot: ther=
e are
> no endpoint reset, stop, or Set TR Dequeue commands for those changes =
to
> suppress. This source review does not replace testing a current kernel.
>
> All five cases below ran in one boot, awake on battery. Before each ca=
se:
> hold the root hub and PCI controller runtime-active; re-enable Bluetoo=
th;
> wait for firmware download and boot plus successful MGMT Read Info; fo=
rce
> the USB device on/active; remove its configuration and interfaces. For=
 the
> diagnostic cases, also require an idle EP0 and disabled data endpoints.
>
> Then perform the indicated action, block tpacpi_bluetooth_sw, wait for=
 USB
> removal, release parent PM holds, and sample the clock condition after=
 PCI
> runtime suspend. The clock reading was stable across three samples.
>
>   State immediately before radio-off                 USB2_PLL_OFF_STS
>   Normal USB suspend, initial control                         1
>   Active U0                                                  0
>   Stop Endpoint (Suspend=3D1), remain U0, wait one second        0
>   Same Stop Endpoint, set U3, wait one second                 1
>   Normal USB suspend, final control                          1
>
> The local diagnostic uses xhci_set_link_state(..., XDEV_U3) after the =
guarded
> EP0 stop. It does not set udev->port_is_suspended or the xHCI suspende=
d_ports
> bit. Both flags were observed clear; USB state remained ADDRESS and ru=
ntime
> PM remained active/manual. Debugfs showed EP0 stopped and PORTSC 0x663=
 (U3)
> before and after a measured 1.000659-second wait. The stopped-U0 case =
showed
> PORTSC 0x603 across its matched wait. No normal suspend callback was u=
sed
> for the isolated case.
>
> The verifier checked command success, firmware readiness, no target UR=
Bs,
> no unexpected target port writes, no target/parent PM transitions duri=
ng
> isolation, and zero trace loss. No kernel errors occurred in the compa=
rison.
> An initial AC-connected preflight refusal preceded the valid compariso=
n and
> did not change the test state.
>
> At the first disconnect event, all five cases already report identical
> PORTSC 0x000202a0: disconnected, disabled, RxDetect, power on, CSC set.
> Their subsequent target PORTSC writes are also identical:
>   0x000202a0, 0x0a0002a0, 0x0a0202a0.
> Disable Slot is issued in each case. Earlier captures verified success=
ful
> Disable Slot completion even when the clock stayed on.
>
> The local source and saved AML show:
>   thinkpad_acpi bluetooth_set_status -> SBDC(0) -> BPWC(0)
>   -> SGOV(0x00140414, 0), a GPIO output change.
> There is no USB-suspend handshake in this path. By disconnect handling=
 time,
> the port is disabled; the normal xHCI U3 operation requires an enabled=
 port.
>
> Other established controls: driver unbinding, removal of USB configura=
tion,
> logical USB removal before radio-off, and extra active-idle time do not
> substitute for suspension. Resuming a suspended device before radio-off
> reintroduces the failure. Cycling the empty port's power repairs it, b=
ut
> that has only been treated as a diagnostic recovery, not a proposed fi=
x.
>
> Is there a known controller/PHY or CNVi sequencing requirement for act=
ive
> full-speed Bluetooth removal on this controller? In particular, should
> the disconnected/disabled port release this clock autonomously, or is
> there a documented platform pre-power-off sequence or controller recov=
ery
> that Linux should implement?
>
> The guarded diagnostic patches, exact harness, traces, register snapsh=
ots,
> and hash-verified evidence are available. QEMU validates the diagnosti=
c's
> guards and isolated U3 behavior, but does not reproduce Intel PMC beha=
vior.
> The internal defect, minimum useful suspend duration, and production f=
ix
> remain unestablished.
>
> Investigation and drafting were assisted by Codex.  Any mistakes,
> however, are entirely and regrettably my own.
>
> Thank you very much for your attention and your work maintaining this
> stack.  if I can provide any further details, I'm very happy to.
>
> Karlos Abel

Can you try with just disabling the thinkpad_acpi bluetooth interface? i=
.e.

sudo echo "options thinkpad_acpi bluetooth=3D0" =C2=A0>> =C2=A0/etc/modp=
robe/thinkpad_acpi.conf

We've been seeing issues with it on a number of platforms. It calls the =
BIOS to power down the BT module and then it's not really needed and jus=
t breaks things (Windows doesn't use this particular ACPI interface).

Honestly don't know on most of what you found (I'm guilty of skim-readin=
g it a bit I'm afraid). If removing that call to the FW fixes it....that=
 would be interesting

Mark
