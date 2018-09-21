From: "Peter Feuerer" <peter@piie.net>
Subject: Re: [PATCH 0/6] platform/x86: acerhdf: new BIOS string, better
 modparam handling
Date: Fri, 21 Sep 2018 06:20:27 +0000
Message-ID: <f401b6fed813afb86f5442c7707bf9fb@piie.net>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

21. September 2018 03:45, "Paul Gortmaker" <paul.gortmaker@windriver.com> schrieb:

> I came across this older netbook over the xmas holidays, and noticed the
> acerhdf driver wouldn't load. Turns out the BIOS string was too new,
> and not listed in the driver. There were module params for overrides,
> but I found their use isn't quite clear without reading the source.
> 
> Here I clarify some of the module parameter usage, and then add the new
> BIOS string, so they won't be needed for this particular platform. Some
> probe code is also shifted out to be __init to reduce the driver size a
> bit. Further details can be found in the respective commit logs.
> 
> Since it was months ago when I created these patches, I retested on top
> of tree to ensure things still work, as can be seen below.

Thanks a lot for your work and this set of changes.  This improves quality.
I reviewed all 6 patches.

Reviewed-by: Peter Feuerer <peter@piie.net>

Please also add CC: Boris Petkov <bp@suse.de> for review.

[...]

-- 
kind regards,
--peter;
