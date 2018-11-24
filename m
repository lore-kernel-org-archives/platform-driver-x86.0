From: Eric Wong <e@80x24.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add adaptive_kbd_modes
 parameter
Date: Sat, 24 Nov 2018 23:23:27 +0000
Message-ID: <20181124232327.t3awc6dnjqdtvzwu@dcvr>
References: <20181115073429.z44czywrf7f65ndb@dcvr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181115073429.z44czywrf7f65ndb@dcvr>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Shuduo Sang <shuduo.sang@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Eric Wong <e@80x24.org> wrote:
> The above setting with this change and the following keymap
> preserves my sanity on the atrocious adaptive keyboard on
> the 2nd-gen X1 Carbon:

Any comments on this patch?  The Esc and F-keys on the keyboard
are still numb and I'll be getting rid of the laptop in a few
days; but maybe my patch can still be useful to others...
