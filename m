From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 00/11] Intel SGX Driver
Date: Wed, 15 Nov 2017 11:35:42 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711151127570.1805@nanos>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:41042 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932239AbdKOKfs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 05:35:48 -0500
In-Reply-To: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>

On Mon, 13 Nov 2017, Jarkko Sakkinen wrote:

Any reason why you did not CC the x86 maintainers and other x86 developers
who have had opinions on the first attempt to get SGX into the kernel?

This is not some driver for a random peripheral. This has substantional
effects. I'm assuming you simply forgot or were not aware, but this is not
the way this works.

Thanks,

	tglx
