From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] pvevent: pvevent device driver
Date: Mon, 18 Mar 2013 10:55:07 +0100
Message-ID: <5146E47B.1090902@redhat.com>
References: <1363251073-20380-1-git-send-email-hutao@cn.fujitsu.com>
	<1363376111.2553.6.camel@x230.sbx07502.somerma.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <1363376111.2553.6.camel@x230.sbx07502.somerma.wayport.net>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Natapov <gleb@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Hu Tao <hutao@cn.fujitsu.com>, qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>, Orit Wasserman <owasserm@redhat.com>, Juan Quintela <quintela@redhat.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, Jan Kiszka <jan.kiszka@siemens.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andrew Jones <drjones@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Sasha Levin <levinsasha928@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Il 15/03/2013 20:35, Matthew Garrett ha scritto:
> On Thu, 2013-03-14 at 16:51 +0800, Hu Tao wrote:
> 
>> +	{ "MSFT0001", 0},
> 
> This seems wrong, and it looks like qemu agrees. Can you resubmit when
> there's agreement on the name?
> 
>> +	acpi_evaluate_object(handle, "WRPT", &arg_list, NULL);
> 
> Is there a spec for this?

Not yet.  Hu, in the next version of your QEMU patches you probably will
not need anymore usage information in docs/pvevent.txt.  Instead, please
add a spec for both the ISA and ACPI interfaces in docs/spec/pvevent.txt.

> Is the only reason for this to allow guests to notify the host that
> they've panicked? It seems like making use of pstore to push the crash
> dump to the host. as well would be a useful thing to do.

Since we try to limit the amount of VM-specific interfaces we have
(yeah, I know this is one), that would mean implementing APEI in QEMU, I
guess.  It is definitely a useful thing to have, but a bit wider in
scope than a simple device to distinguish idle and crashed VMs.

Paolo
