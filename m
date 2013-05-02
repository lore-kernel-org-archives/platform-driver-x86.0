From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 2 (platform/x86/toshiba_acpi)
Date: Thu, 02 May 2013 14:41:45 -0700
Message-ID: <5182DD99.7070808@infradead.org>
References: <20130502173537.c8aa671a1b22abe2ec341b87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20130502173537.c8aa671a1b22abe2ec341b87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 05/02/13 00:35, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v3.11 destined work to your linux-next included
> branches until after v3.10-rc1 is released.
> 
> Changes since 20130501:
> 

when TOSHIBA_ACPI=y and SERIO_I8042=m:

drivers/built-in.o: In function `toshiba_acpi_remove':
toshiba_acpi.c:(.text+0x29827a): undefined reference to `i8042_remove_filter'
drivers/built-in.o: In function `toshiba_acpi_add':
toshiba_acpi.c:(.text+0x298b8c): undefined reference to `i8042_install_filter'
toshiba_acpi.c:(.text+0x298c3b): undefined reference to `i8042_remove_filter'


-- 
~Randy
