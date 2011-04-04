From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH 1/2] thinkpad_acpi: Correct !CONFIG_THINKPAD_ACPI_VIDEO warning
Date: Mon, 4 Apr 2011 22:51:33 +0200
Message-ID: <BANLkTimqTkZgZJf-o04EEkWtdn5-ikKo9A@mail.gmail.com>
References: <20110404130036.GB16669@srcf.ucam.org>
	<664bf5e5585f3d959d6c57524d09353dd8d49f3f.1301936559.git.joe@perches.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:47157 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755672Ab1DDUve (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 16:51:34 -0400
In-Reply-To: <664bf5e5585f3d959d6c57524d09353dd8d49f3f.1301936559.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 4, 2011 at 7:06 PM, Joe Perches <joe@perches.com> wrote:
> Move TPACPI_HANDLE declaration into #ifdef block
> and neaten it a bit.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
