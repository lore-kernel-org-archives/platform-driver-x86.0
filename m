From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] x86, acpi: LLVMLinux: Remove nested functions from Thinkpad ACPI
Date: Wed, 12 Feb 2014 21:27:59 +0000
Message-ID: <yw1xzjlw58dc.fsf@unicorn.mansr.com>
References: <1392238726-18787-1-git-send-email-dl9pf@gmx.de>
	<20140212211159.GA29409@infradead.org>
	<52FBE5A5.3040602@converseincode.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:46084 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753763AbaBLVez convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Feb 2014 16:34:55 -0500
In-Reply-To: <52FBE5A5.3040602@converseincode.com> (Behan Webster's message of
	"Wed, 12 Feb 2014 13:20:37 -0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Christoph Hellwig <hch@infradead.org>, dl9pf@gmx.de, David Woodhouse <David.Woodhouse@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Behan Webster <behanw@converseincode.com> writes:

> On 02/12/14 13:11, Christoph Hellwig wrote:
>> On Wed, Feb 12, 2014 at 09:58:46PM +0100, dl9pf@gmx.de wrote:
>>> being able to compile the Linux kernel with Clang. The use of neste=
d functions
>>> blocks this effort.
>> Is there any good way to make gcc warn about the use of nested funct=
ions?
> Interesting idea.
>
> '-Wtrampolines'
>      Warn about trampolines generated for pointers to nested function=
s.
>
>      A trampoline is a small piece of data or code that is created at
>      run time on the stack when the address of a nested function is
>      taken, and is used to call the nested function indirectly.  For
>      some targets, it is made up of data only and thus requires no
>      special treatment.  But, for most targets, it is made up of code
>      and thus requires the stack to be made executable in order for t=
he
>      program to work properly.
>
> That might work.

That sounds like it will only warn if a trampoline is needed.  A nested
function whose address isn't taken, as is the case here, wouldn't
trigger this warning.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
