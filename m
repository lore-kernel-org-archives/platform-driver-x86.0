From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/8] platform/x86: fujitsu-laptop: switch to a managed
 backlight input device
Date: Wed, 29 Mar 2017 12:58:04 -0700
Message-ID: <20170329195804.GD15472@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-3-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-3-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 20, 2017 at 10:32:18AM +0100, Michał Kępień wrote:
> Use a managed input device for brightness events in order to simplify
> two error paths and one cleanup function while also reducing the number
> of local variables required.  Remove double assignment to make
> checkpatch happy.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>


And this one mostly addresses my commentary on 1/8.

-- 
Darren Hart
VMware Open Source Technology Center
