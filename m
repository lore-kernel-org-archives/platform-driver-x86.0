From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/1 v2] classmate-laptop: Add support for Classmate V4
 accelerometer.
Date: Mon, 23 Jul 2012 14:36:18 +0100
Message-ID: <20120723133618.GC21838@srcf.ucam.org>
References: <cover.1340976795.git.magomez@igalia.com>
 <39ac42c709e498fbef4f0f0f24edc5331e5f4473.1340976795.git.magomez@igalia.com>
 <20120717224749.GA20813@nautilus.holoscopio.com>
 <5006BFEC.1010407@igalia.com>
 <20120723132841.GD21495@srcf.ucam.org>
 <500D52A7.8040606@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57817 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325Ab2GWNgX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jul 2012 09:36:23 -0400
Content-Disposition: inline
In-Reply-To: <500D52A7.8040606@igalia.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Miguel =?iso-8859-1?Q?G=F3mez?= <magomez@igalia.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, don@syst.com.br, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 23, 2012 at 03:33:27PM +0200, Miguel G=F3mez wrote:

> Names are upper-cased in acpica, so the device is reported as
> FNBT0000. But in the driver it's named FnBT0000, and that's why it
> doesn't match.

So just change the existing entry in the driver to FNBT0000?

--=20
Matthew Garrett | mjg59@srcf.ucam.org
