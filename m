From: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Subject: Re: Wireless key on Fujitsu E753 not working since a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Mon, 12 Aug 2013 15:46:46 +0200
Message-ID: <CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:39743 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756181Ab3HLNqr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Aug 2013 09:46:47 -0400
Received: by mail-qc0-f173.google.com with SMTP id z10so3368887qcx.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2013 06:46:47 -0700 (PDT)
In-Reply-To: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

as I have not received any answer I'd like to ask again, what to do
with that problem, because I don't have a clue at all...

Regards,

jhs

2013/6/28 Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>:
> Hi,
>
> since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
> wireless key on my Fujitsu E753 is not working any more. If I boot up
> with parameter "acpi_osi="!Windows 2012"" it works, though.
> I filed an ACPI-bug
> (https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
> (https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
> caused by the fujitsu_laptop driver. So I report it here. Should I
> file a bug anywhere or is it enough to write it to the list?
>
> Thanks in advance,
>
> jhs
