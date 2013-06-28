From: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Subject: Wireless key on Fujitsu E753 not working since a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Fri, 28 Jun 2013 16:14:57 +0200
Message-ID: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:63114 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755159Ab3F1OPA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Jun 2013 10:15:00 -0400
Received: by mail-qc0-f170.google.com with SMTP id s1so1389214qcw.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2013 07:14:59 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
wireless key on my Fujitsu E753 is not working any more. If I boot up
with parameter "acpi_osi="!Windows 2012"" it works, though.
I filed an ACPI-bug
(https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
(https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
caused by the fujitsu_laptop driver. So I report it here. Should I
file a bug anywhere or is it enough to write it to the list?

Thanks in advance,

jhs
