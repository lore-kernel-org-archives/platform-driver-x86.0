From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 17/22] thinkpad_acpi: Replace strnicmp with strncasecmp
Date: Tue, 16 Sep 2014 15:08:57 -0700
Message-ID: <20140916220857.GA12780@vmdeb7>
References: <1410900696-6481-1-git-send-email-linux@rasmusvillemoes.dk>
 <1410900696-6481-18-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410900696-6481-18-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 16, 2014 at 10:51:31PM +0200, Rasmus Villemoes wrote:
> The kernel used to contain two functions for length-delimited,
> case-insensitive string comparison, strnicmp with correct semantics
> and a slightly buggy strncasecmp. The latter is the POSIX name, so
> strnicmp was renamed to strncasecmp, and strnicmp made into a wrapper
> for the new strncasecmp to avoid breaking existing users.

When was this done? As of this morning I still see them as independent functions
in lib/string.c.

-- 
Darren Hart
Intel Open Source Technology Center
